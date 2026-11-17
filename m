Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.668.1794942513923505823
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 11:08:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=rtT+WzhQ;
 spf=pass (domain: gmail.com, ip: 74.125.224.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-67dabd38cdfso6109d50.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 11:08:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794942513; cv=none;
        d=google.com; s=arc-20260327;
        b=LwMJXGQXXD8v1JNYwBqcz1fvSBWJArNhNZk35WkftXQnC1YXn9uR8nmFTqn6c/Qyuq
         l4/lMxDWH7FuLYkQ+g2qnR/88Xdflv2U3fFRRs9wU5ACz2v2IJEEKfoX+Jb5DA9YQtU1
         LVgZBVn5WurM3/nZ9aBGZ1ttSCInceEReQ5f51khAgsk55o1aQ1hXj5RGxEsmbbIc9Pv
         OxVWr0ymFXiM3euT/Ntamyg+bRwPZPVoA6N6JtPQB2jEfke0Ol8f9p5BPqBIFz5tkNTX
         rOMIMO39W/MNdtB5f5//ur+HgYSaOePXlBxPMwz+wS4iqwAHGNVsyz5yVHwxHugMY9jB
         aoGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jqFFzpOFDHIQ0apBp4IP9PORPpEpxsFpG9WIMtGGyeA=;
        fh=VrppvHgXZoYtu+CngtXU6dqc7FhkctwaAOQ9XtMNvL0=;
        b=ZEx+/myI+Np/GxE46/movRRktnLJeRP1cW/DGER6PZNKScNKObRj0Bnc8FqwDAYR7V
         Tg1EcflcRZVPo/Y85vybnlV6dcGRvska1GBUc5W2l8DL5LagBHSoYU1a3fCwrG2jJhLH
         oecQaR+JFu1i5yh6onNk67ck0HuVEn6NPS7TaI+QMsJJni9d5jdel4/EdNC3k7kvcyXh
         YYYCHFT3OfHbDHvQLWwyhI7PPnlk0lT7vcgP2H/OJvzFK3JpnfIGA+Sxi/2DbbqzVFWp
         PYbMSkoDdi2NESD3KLPucOqNJpidMIQTJAxXXnlT8CSQPMytwBPnQCI32oJiuDSYkFJ9
         8lRg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794942513; x=1795547313; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jqFFzpOFDHIQ0apBp4IP9PORPpEpxsFpG9WIMtGGyeA=;
        b=rtT+WzhQ5C8sbt0p+ltVHLvHUHS9Vf3K9y/+x5ypazSUyxQ5T4lE0I7W6+DioI8l5Y
         BEq3YWgRNdkYUdOgu+zB52sp74Gpyc4+CIsnNzR8viCl47WUbTmlkZiTlzNSnA1aEpWI
         p41dphEv8uxUG14SYG8vbaT3nupdgYdoVFYUn8D9rsRSP0jeG3Fd5luTTJs9uP8QcGhZ
         tW6im9L4IlfL2uSvUwQ3FGsyD5844/KHzsnk/Y4Ks1mj8NHg5K1iVom6vp/jhHEw2HwG
         cH986V5IC6xa4YWJZdQBhvIXNjDWUtxot9NAEBVLSYDnpm660sbvryzlWKYLNg2Euffm
         XL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794942513; x=1795547313;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jqFFzpOFDHIQ0apBp4IP9PORPpEpxsFpG9WIMtGGyeA=;
        b=bAvF6+ZwPRdvoJTjUMg4bRRkhoArkLfGyNZ5taz+oCKzhTPUZy8LIub4iNxL2QNDbx
         aYxbmNJcWrfgNvOCmNYga/XzvQ/ZxkDiFeG/cRK4OSxFH1+DJP7R4/gB5ohAAAynCFI/
         SjVW5wjLrWK2kjiOcLRJF3cIZk6BNxULw5c9sT7lIkksiF7P5cwFqpZf1o/zLQQNIKeV
         6L6zq8W97NoW8gmBVQPSfaQ/oovKnLI0NdFhMZlWxOppM417xM/y+6fjf1lblGaOaION
         NWf6pUpAMK3vCwI/cBPd9lZdFejaAszDld1AP+D6AnW1XEW4LhtnkWKjc6iqkopng8Ii
         PSbQ==
X-Gm-Message-State: APuU4Z+ZNaMo9OawJiZnp6PCdknVN9O8HFpIhZgxWkGF5rz8G18fSj2l
	LkCybYXfZNK4dzdL7H3jq+axtvsJnBNUFe+tH669Z1HQTlamBpQmj6UEFTPScoN+EV9hyRYOHfs
	B37/H9Xm6bLH2B8edWCFHvILA3e5jVOE=
X-Gm-Gg: AZFdTZe8zfB2nGgZ6Z1IsbMKoFABT786h3ESxENVsKwrZ4gsIzMevjTf1zWpttlTPq5
	CW1CwgujC6mjdbTLMk9fZM7gaqyvzAIpbKAuCK6qhgOm0qEOEG7p9oNWfXa3ySZ5qmvRRSDaG3L
	lbhgLQAdteW40F9PRb3U7yUtlSYy+wWR7cRVxvfAXXel/8CytzK4Ui79NU99UIhRbLCy76toV3U
	Y5whow1kkOpMtPROs4QV80a/DBv+2qScO8INq3n5tlBkUo5sUwP6CWp5apDSAJjX6VZRLBZkanq
	0oY6Lzzu3vsDiZoz6l9W4n/v2UOtllL1RN94KPN66rq84dJYA1rEe/GScbcLvaeEZNNEdl4Xhxt
	zOX9hBXn4CBmn2bV6kW75e27lQCQ22X5BbjJ8HPa/rVqXtLrcgwI5/GgE0NrBvXUrgipOdp8=
X-Received: by 2002:a05:690e:439a:b0:67d:ba3f:a9a6 with SMTP id
 956f58d0204a3-67dd3fa46camr166608d50.21.1794942512873; Tue, 17 Nov 2026
 11:08:32 -0800 (PST)
MIME-Version: 1.0
References: <20260706171701.70536-1-alex.kanavin@gmail.com>
 <20260706171701.70536-3-alex.kanavin@gmail.com> <DMVU99KK0OIS.XC4NZF0E3TR8@smile.fr>
In-Reply-To: <DMVU99KK0OIS.XC4NZF0E3TR8@smile.fr>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 17 Nov 2026 20:08:20 +0100
X-Gm-Features: AclHuK_MPgESI9bLVkI7OwqOvkpfWZ_V-MArODR9RnMIt9I0FTZZEhalPQVV8KE
Message-ID: <CANNYZj_ccwXceqk4qME9QhTQ35gstPvnYxWC_v8H5m9Hut1-Ow@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 03/45] acl: upgrade 2.3.2 -> 2.4.0
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="000000000000df445906607d9e94"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 19:08:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250487

--000000000000df445906607d9e94
Content-Type: text/plain; charset="UTF-8"

On Sun, 15 Nov 2026 at 15:02, Yoann Congal <yoann.congal@smile.fr> wrote:

> I think this upgrade resulted in a silent ptest regression:
>
> Regression report for yocto-6.1_M2 (target master, base yocto-6.1_M1):
>
> https://downloads.yoctoproject.org/releases/yocto/milestones/yocto-6.1_M2/testresults/testresult-regressions-report.txt
> |Regression:  runtime_core-image-ptest-acl_qemux86-64_20260609020141
> |             runtime_core-image-ptest-acl_qemux86-64_20260723201535
> |    Total: 9 new regression(s):
> |    9 regression(s) for ptestresult.acl
> |        ptestresult.acl.cp.test: PASSED -> No matching test result
> |        ptestresult.acl.getfacl-lfs.test: PASSED -> No matching test
> result
> |        ptestresult.acl.getfacl-noacl.test: PASSED -> No matching test
> result
> |        ptestresult.acl.getfacl-recursive.test: PASSED -> No matching
> test result
> |        ptestresult.acl.malformed-restore.test: PASSED -> No matching
> test result
> |        ptestresult.acl.misc.test: PASSED -> No matching test result
> |        ptestresult.acl.sbits-restore.test: PASSED -> No matching test
> result
> |        ptestresult.acl.setfacl-X.test: PASSED -> No matching test result
> |        ptestresult.acl.utf8-filenames.test: PASSED -> No matching test
> result
> |    Additionally, 1 new test(s) is/are present
>
> Because upstream commit f55ec6b "Use .run as the filename extension for
> "run" test scripts" [0] changed tests filenames but our run-ptest calls:
> | for f in *.test; do
> |     LD_PRELOAD=$(pwd)/libtestlookup.so ./run $f
> Which, in case of no file matching "*.test", will call literally "./run
> '*.test'" and this succeed for having no failing tests (but no tests at
> all).
>
> [0]:
> https://github.com/sailfishos-mirror/acl/commit/f55ec6b2e6b9094414b41df67bd19cbbfd48e8be
> (random working mirror)


Thanks, I just sent a patch for it.

Alex

--000000000000df445906607d9e94
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, 15 Nov 2026 at 15:02, Yoann Conga=
l &lt;<a href=3D"mailto:yoann.congal@smile.fr">yoann.congal@smile.fr</a>&gt=
; wrote:</div><div class=3D"gmail_quote gmail_quote_container"><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">I think this upgrade resulted in a si=
lent ptest regression:<br>
<br>
Regression report for yocto-6.1_M2 (target master, base yocto-6.1_M1):<br>
<a href=3D"https://downloads.yoctoproject.org/releases/yocto/milestones/yoc=
to-6.1_M2/testresults/testresult-regressions-report.txt" rel=3D"noreferrer"=
 target=3D"_blank">https://downloads.yoctoproject.org/releases/yocto/milest=
ones/yocto-6.1_M2/testresults/testresult-regressions-report.txt</a><br>
|Regression:=C2=A0 runtime_core-image-ptest-acl_qemux86-64_20260609020141<b=
r>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0runtime_core-image-ptest-a=
cl_qemux86-64_20260723201535<br>
|=C2=A0 =C2=A0 Total: 9 new regression(s):<br>
|=C2=A0 =C2=A0 9 regression(s) for ptestresult.acl<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 ptestresult.acl.cp.test: PASSED -&gt; No match=
ing test result<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 ptestresult.acl.getfacl-lfs.test: PASSED -&gt;=
 No matching test result<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 ptestresult.acl.getfacl-noacl.test: PASSED -&g=
t; No matching test result<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 ptestresult.acl.getfacl-recursive.test: PASSED=
 -&gt; No matching test result<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 ptestresult.acl.malformed-restore.test: PASSED=
 -&gt; No matching test result<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 ptestresult.acl.misc.test: PASSED -&gt; No mat=
ching test result<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 ptestresult.acl.sbits-restore.test: PASSED -&g=
t; No matching test result<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 ptestresult.acl.setfacl-X.test: PASSED -&gt; N=
o matching test result<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 ptestresult.acl.utf8-filenames.test: PASSED -&=
gt; No matching test result<br>
|=C2=A0 =C2=A0 Additionally, 1 new test(s) is/are present<br>
<br>
Because upstream commit f55ec6b &quot;Use .run as the filename extension fo=
r<br>
&quot;run&quot; test scripts&quot; [0] changed tests filenames but our run-=
ptest calls:<br>
| for f in *.test; do<br>
|=C2=A0 =C2=A0 =C2=A0LD_PRELOAD=3D$(pwd)/libtestlookup.so ./run $f<br>
Which, in case of no file matching &quot;*.test&quot;, will call literally =
&quot;./run<br>
&#39;*.test&#39;&quot; and this succeed for having no failing tests (but no=
 tests at<br>
all).<br>
<br>
[0]: <a href=3D"https://github.com/sailfishos-mirror/acl/commit/f55ec6b2e6b=
9094414b41df67bd19cbbfd48e8be" rel=3D"noreferrer" target=3D"_blank">https:/=
/github.com/sailfishos-mirror/acl/commit/f55ec6b2e6b9094414b41df67bd19cbbfd=
48e8be</a> (random working mirror)</blockquote><div><br></div><div>Thanks, =
I just sent a patch for it.</div><div><br></div><div>Alex=C2=A0</div></div>=
</div>

--000000000000df445906607d9e94--
