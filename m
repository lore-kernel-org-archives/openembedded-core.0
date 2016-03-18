Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 5E4586FFEF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 11:38:29 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id o5so49761235iod.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 04:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=M1jSbEmFBGtM3hFHSYNw1TDiPUhAq4pccpfdW+lV+LY=;
	b=ywlU5lIl2o2JEqzdGQg69iH6m6ZHqkbj+JRRdrYy+f16IdICBpRzTpiQSHKA7t3Yel
	b2JlxpmWvMZRMAL9WH6lrSM2OZMZPMITmgTPG2mIdzNA/x5/cbexFqzcmLCfzMOmGcFD
	aG4oNd0zBiZvpP+gOsTmHU/H1q59q7K6RqzUk0mheWnHvOYTciiKVW33j5tRVLCmrqTG
	PbUniPtMcDaHx1oSd14MqW4Zn0Y8IevtJQHz/50JYsymQbqtDO0N6JT4Pk/LqyOQ0Rzq
	px0zSkJcUtq+wCsIJNlUWFpVWT+lNoOfQdEtIv0z15o/iHiEBTjYk1O4U3s9d4+8NM3I
	Wkdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=M1jSbEmFBGtM3hFHSYNw1TDiPUhAq4pccpfdW+lV+LY=;
	b=GlBDTxDhn7qWPC85YaPaObwSoyT7eb8ZYlHE9ZiSu1SM20WjpkQZqU9R5ru3sN5WCS
	k9aV2YIpvBDdvCTC38tAsbrzFU32pmjUdE7p5LCXgaVmHdohap+8XbX9eIPzK0iPZhCH
	EoBWBGNi+JQCkVLj+mmGgnpcLslwzrmd1RwyCfmZ7ehRqTEvUXoEaaPZ+SK/D7E+AhEB
	vm5EXeKjqiHxHfI9e3Vw12iNQjIz/BCzage8oxXvQmykcnfkdUidCzvwOUpBBRspOqle
	AQXyQhZNgr4SuP0aX/Jjj6kAEU9EmCUOeVjlArXQWOgxFt82UCYveGzZp7xOCaXven/P
	GfzA==
X-Gm-Message-State: AD7BkJJk6+0eBl6pi9+DgCUtW1hEMBFczym7KqcjJnoAdPgaRJXPQ1FP+EurRUfXkuYuZSIcWVANLaASFNmCrwsQ
X-Received: by 10.107.6.32 with SMTP id 32mr14144477iog.99.1458301110152; Fri,
	18 Mar 2016 04:38:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 18 Mar 2016 04:38:10 -0700 (PDT)
In-Reply-To: <1BF009E9-B718-4FE2-BBF3-83CEA93D1ABB@gmail.com>
References: <1456753354-7448-1-git-send-email-adrian.ratiu@ni.com>
	<CAJTo0LYcCQ9f0W6gQPtemxKjzCVo55M-pS+iWatV5YsfDrq41A@mail.gmail.com>
	<1BF009E9-B718-4FE2-BBF3-83CEA93D1ABB@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 18 Mar 2016 11:38:10 +0000
Message-ID: <CAJTo0Laq7Re6hAEmY=Dd1=UUr0+Zg9UCDO5STXoDJni+Md86+g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Jacob Champion <jacob.champion@ni.com>
Subject: Re: [PATCH v1] site: enable pthread support for x86_64 APR builds
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Mar 2016 11:38:30 -0000
Content-Type: multipart/alternative; boundary=001a113fbf5ca58466052e512fa2

--001a113fbf5ca58466052e512fa2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 18 March 2016 at 00:22, Khem Raj <raj.khem@gmail.com> wrote:

> Which is interesting as building apr-native (so the site files don't get
> used) for x86-64 gives:
>
> apr_cv_process_shared_works=3Dyes
>
> Can we not go around disabling stuff when it actually does work?
>
>
> No it really doesnt work. its running a configure time test on your build
> host ( which I assume is x86_64 mostly now
> a days) and then deciding that process shared mutexes work, which is not
> correct.
>
> If we think that it should work on x86_64 then lets cache the value to
> =E2=80=98yes=E2=80=99 but not leave it
> at the mercy of configure.
>

That was my point: the patch was to add works=3Dno to x86-64 target builds,
but if I run the same test on x86-64 hardware directly then the result is
works=3Dyes.

Ross

--001a113fbf5ca58466052e512fa2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 March 2016 at 00:22, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div><span class=3D""><blockquote ty=
pe=3D"cite"><div><div dir=3D"ltr"><div class=3D"gmail_extra">Which is inter=
esting as building apr-native (so the site files don&#39;t get used) for x8=
6-64 gives:</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra">apr_cv_process_shared_works=3Dyes<br></div><div class=3D"gmail_extra"=
><br></div><div class=3D"gmail_extra">Can we not go around disabling stuff =
when it actually does work?</div></div></div></blockquote><div><br></div></=
span>No it really doesnt work. its running a configure time test on your bu=
ild host ( which I assume is x86_64 mostly now</div><div>a days) and then d=
eciding that process shared mutexes work, which is not correct.=C2=A0</div>=
<div><br></div><div>If we think that it should work on x86_64 then lets cac=
he the value to =E2=80=98yes=E2=80=99 but not leave it</div><div>at the mer=
cy of configure.</div></blockquote></div><br>That was my point: the patch w=
as to add works=3Dno to x86-64 target builds, but if I run the same test on=
 x86-64 hardware directly then the result is works=3Dyes.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113fbf5ca58466052e512fa2--
