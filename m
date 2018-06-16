Return-Path: <jpuhlman@mvista.com>
Received: from mail-ot0-f194.google.com (mail-ot0-f194.google.com
	[74.125.82.194])
	by mail.openembedded.org (Postfix) with ESMTP id 79DC26FFC8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jun 2018 20:28:39 +0000 (UTC)
Received: by mail-ot0-f194.google.com with SMTP id h6-v6so14625414otj.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jun 2018 13:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language;
	bh=JDBy4Ab2FKCLOY4Bc2MEy/57JhcvIQrK4hbWM3WJVDk=;
	b=LMO4JUemdP2yZvRuV14uOD4ZUvEFqgDDHnquRp2TSwbr+Mca5qbGtVD42m1LO54rwx
	SvkoGeiWApgNszYRgLMfKmgVN7AguZMFhzEAutxhEM5j/hgNthsjmeG+ILsR4WoyLa4t
	sJC+3Hj4rC3gS8WKaZfrkSOYCZ18MHKMO+wdgEnxz4Kh7e/q2X9XyBpNlCmMBZFLmWEc
	Oa9nvQEns2yYjLgMVw/xyPHqc1PrVXSMDjH4DUGW1oH3+w9krlllgO0gdm38GS2LtmwV
	seCGyREPyz/ewB/woVnuTrhNSNLADf8+QyJbo6Bwp1RsrhJ7DEoHQSSZrBQv3sKel4bT
	ppzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=JDBy4Ab2FKCLOY4Bc2MEy/57JhcvIQrK4hbWM3WJVDk=;
	b=Lm5mmTDjvPdhj/EKdk3FdinEgaEiwTp9a390257WZ5iHk34oZV+vbJQN0dDaqyFAr1
	N7UmIgJHBiL0fGtUIcd3rCgy+B9jYhmEM/0v7NKQDm2LvlzRGVyYV34TTmZBhi4fO/UI
	l+77LsTF9RRTfmhtqzrhaKwXetYwN0WLEbztBIi6+vMGpDnrgiNgRll1/GnEJbj5MCoN
	pppZA2lhsYgJ7994AQlfV3tm35asd8PReiYlWFQkUonMHaF4iLEad/SYpSNiMK5K7n3d
	Ehiqyj+ZPuwWjHN09cLMuPWcMQVrDlyQmAAzvoMNNOuYEvopVVpl6kgM7/HaAgF9eROD
	VFIg==
X-Gm-Message-State: APt69E28djtTmCNyZKUWebwiLlg6Bz7utA0YXFYMlb6h/iT9KcYgnRln
	iGn2bd4MSP49IYXAs/83jaMV1jtqY7I=
X-Google-Smtp-Source: ADUXVKKP/7tZEcTqUQHWcvrE/DPR3niAU7oxjICoG15Swvp2PGrGr/il52rZBey+1y3toqS0FYk61A==
X-Received: by 2002:a9d:4d85:: with SMTP id
	u5-v6mr3938246otk.157.1529180918714; 
	Sat, 16 Jun 2018 13:28:38 -0700 (PDT)
Received: from ?IPv6:2600:1700:4c90:60a0:5566:b07f:3f47:4a0e?
	([2600:1700:4c90:60a0:5566:b07f:3f47:4a0e])
	by smtp.gmail.com with ESMTPSA id
	c2-v6sm5300999oib.55.2018.06.16.13.28.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 16 Jun 2018 13:28:37 -0700 (PDT)
To: richard.purdie@linuxfoundation.org,
	OE-core <openembedded-core@lists.openembedded.org>
References: <1529110789-13035-1-git-send-email-jpuhlman@mvista.com>
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Message-ID: <94ec954b-00ad-7bfd-a6be-550f16eb4c30@mvista.com>
Date: Sat, 16 Jun 2018 13:28:35 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1529110789-13035-1-git-send-email-jpuhlman@mvista.com>
Subject: Re: [PATCH] update-alternatives: Don't process duplicated entries
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
X-List-Received-Date: Sat, 16 Jun 2018 20:28:39 -0000
Content-Type: multipart/alternative;
	boundary="------------1CCCCAC4066EA49337244983"
Content-Language: en-US

--------------1CCCCAC4066EA49337244983
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

> On Fri, 2018-06-15 at 17:59 -0700, Jeremy Puhlman wrote:
>> If ALTERNATIVE_<pkg> lists the same entry more then once, the
>> update-alternatives identical install and remove actions are added
>> for
>> each repeated entry. This is exhibited when you add meta-selinux, and
>> examine the busybox package, which installs every link twice because
>> it
>> alters the links to point to the shell replacements so selinux will
>> work
>> with them. This can generate warnings on do_rootfs about similarly
>> prioritized alternatives. Given that at this point in the processing
>> the addtions should always be identical there shouldn't be any good
>> reason to add them twice.
>> 
>> Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
>> ---
>>  meta/classes/update-alternatives.bbclass | 4 ++++
>>  1 file changed, 4 insertions(+)
>
> Shouldn't we detect and make this a fatal error in one of the other
> sanity tests like we do for PACKAGES for example?

That is certainly one way to go, it would also require at least a fix to the selinux append(which is what I
did first), but I figured a more generalized fix would be more useful in the long run.

>  Would there ever be a valid use case for duplicate entries here?

Given at this point in the code all the values are pretty much locked in, you can't really create links that are different, so
at least as the way the code is currently structured, there is no value in adding identical values twice as far as I can think
of.

With out any change, there does not appear to be any degradation in the on target alternatives function, in some cases it just generates
a number of "alternatives set at the same priority" warning messages during the image construction. In the PACKAGES case, I thought there
was actual real functional issues with duplicating values in package, which is why it was added. In this case the only real effect would
be cleaner alternatives files/post scripts and no warnings during image builds.

I am fine with either way, as I already have a fix up for the selinux append.

>
> Cheers,
>
> Richard




-- 
Jeremy A. Puhlman
jpuhlman@mvista.com


--------------1CCCCAC4066EA49337244983
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <pre class="content" style="box-sizing: border-box; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; display: block; padding: 9.5px; margin: 0px 0px 10px; line-height: 14.3px; color: rgb(51, 51, 51); word-break: break-all; word-wrap: break-word; background-color: white; border: 0px; border-radius: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;">&gt; On Fri, 2018-06-15 at 17:59 -0700, Jeremy Puhlman wrote:
<span class="quote" style="box-sizing: border-box; color: rgb(0, 127, 0);">&gt;&gt; If ALTERNATIVE_&lt;pkg&gt; lists the same entry more then once, the</span>
<span class="quote" style="box-sizing: border-box; color: rgb(0, 127, 0);">&gt;&gt; update-alternatives identical install and remove actions are added</span>
<span class="quote" style="box-sizing: border-box; color: rgb(0, 127, 0);">&gt;&gt; for</span>
<span class="quote" style="box-sizing: border-box; color: rgb(0, 127, 0);">&gt;&gt; each repeated entry. This is exhibited when you add meta-selinux, and</span>
<span class="quote" style="box-sizing: border-box; color: rgb(0, 127, 0);">&gt;&gt; examine the busybox package, which installs every link twice because</span>
<span class="quote" style="box-sizing: border-box; color: rgb(0, 127, 0);">&gt;&gt; it</span>
<span class="quote" style="box-sizing: border-box; color: rgb(0, 127, 0);">&gt;&gt; alters the links to point to the shell replacements so selinux will</span>
<span class="quote" style="box-sizing: border-box; color: rgb(0, 127, 0);">&gt;&gt; work</span>
<span class="quote" style="box-sizing: border-box; color: rgb(0, 127, 0);">&gt;&gt; with them. This can generate warnings on do_rootfs about similarly</span>
<span class="quote" style="box-sizing: border-box; color: rgb(0, 127, 0);">&gt;&gt; prioritized alternatives. Given that at this point in the processing</span>
<span class="quote" style="box-sizing: border-box; color: rgb(0, 127, 0);">&gt;&gt; the addtions should always be identical there shouldn't be any good</span>
<span class="quote" style="box-sizing: border-box; color: rgb(0, 127, 0);">&gt;&gt; reason to add them twice.</span>
<span class="quote" style="box-sizing: border-box; color: rgb(0, 127, 0);">&gt;&gt; </span>
<span class="quote" style="box-sizing: border-box; color: rgb(0, 127, 0);">&gt;&gt; Signed-off-by: Jeremy Puhlman <a class="moz-txt-link-rfc2396E" href="mailto:jpuhlman@mvista.com">&lt;jpuhlman@mvista.com&gt;</a></span>
<span class="quote" style="box-sizing: border-box; color: rgb(0, 127, 0);">&gt;&gt; ---</span>
<span class="quote" style="box-sizing: border-box; color: rgb(0, 127, 0);">&gt;&gt;  meta/classes/update-alternatives.bbclass | 4 ++++</span>
<span class="quote" style="box-sizing: border-box; color: rgb(0, 127, 0);">&gt;&gt;  1 file changed, 4 insertions(+)</span>
&gt;
&gt; Shouldn't we detect and make this a fatal error in one of the other
&gt; sanity tests like we do for PACKAGES for example?

That is certainly one way to go, it would also require at least a fix to the selinux append(which is what I
did first), but I figured a more generalized fix would be more useful in the long run.

&gt;  Would there ever be a valid use case for duplicate entries here?

Given at this point in the code all the values are pretty much locked in, you can't really create links that are different, so
at least as the way the code is currently structured, there is no value in adding identical values twice as far as I can think
of.

With out any change, there does not appear to be any degradation in the on target alternatives function, in some cases it just generates
a number of "alternatives set at the same priority" warning messages during the image construction. In the PACKAGES case, I thought there
was actual real functional issues with duplicating values in package, which is why it was added. In this case the only real effect would
be cleaner alternatives files/post scripts and no warnings during image builds.

I am fine with either way, as I already have a fix up for the selinux append.

&gt;
&gt; Cheers,
&gt;
&gt; Richard


</pre>
    <br>
    <br>
    <pre class="moz-signature" cols="72">-- 
Jeremy A. Puhlman
<a class="moz-txt-link-abbreviated" href="mailto:jpuhlman@mvista.com">jpuhlman@mvista.com</a>
</pre>
  </body>
</html>

--------------1CCCCAC4066EA49337244983--
