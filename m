Return-Path: <paul.betafive@gmail.com>
Received: from mail-vc0-f169.google.com (mail-vc0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 12A3C60030
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 13:47:14 +0000 (UTC)
Received: by mail-vc0-f169.google.com with SMTP id le20so7512105vcb.28
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 06:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=oAwwHgTNyqNoFxPSLDDyP8UyuoLzSgm+yshO40rCgyY=;
	b=LCVXPgxZbb1LA5XlTXpI3OxR+uXlDOOrFwW7f8wFToULqky8b03Tc/6olSd/e7QNQS
	NnUmNdIX/Xhxxz1vveEHgcThDM9+x2YFB7fo8PWMpvx2TKme94FvjaK9WoANIsy01jie
	Yymzz8cC82qYv0kmKirCEQ3cnRkTeu21pQepI/O6FCq2bul0nUUckgIQyDtVX1C+MU4q
	U/g+CkfWooMvT++L/RoI5mcfZ9H4o3bJg6qT70LO0Xasc+bzNzDlI+BL5llKRlGHwjU+
	knhT8UBUN0HSycnUDJ2nysvf8RTFDdY+RRGrmux56hxhNfYzkxdgp4Uykud3GxCdwx5J
	XJXA==
MIME-Version: 1.0
X-Received: by 10.52.36.131 with SMTP id q3mr206448vdj.90.1408456035036; Tue,
	19 Aug 2014 06:47:15 -0700 (PDT)
Sender: paul.betafive@gmail.com
Received: by 10.220.39.71 with HTTP; Tue, 19 Aug 2014 06:47:14 -0700 (PDT)
Received: by 10.220.39.71 with HTTP; Tue, 19 Aug 2014 06:47:14 -0700 (PDT)
In-Reply-To: <53F33B3C.5050206@windriver.com>
References: <20140819114229.GE7174@gmail.com> <53F33B3C.5050206@windriver.com>
Date: Tue, 19 Aug 2014 14:47:14 +0100
X-Google-Sender-Auth: uJj8JqpUep6kuZWYrTLIi7eKoGs
Message-ID: <CANyK_8cHLJcKC5J+-hcAXgBGTW_HXrwidddC0oUV+29ewPAGeg@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: core-image-full-cmdline build failure
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
X-List-Received-Date: Tue, 19 Aug 2014 13:47:15 -0000
Content-Type: multipart/alternative; boundary=20cf307c9fcaa673250500fbb93d

--20cf307c9fcaa673250500fbb93d
Content-Type: text/plain; charset=UTF-8

On Aug 19, 2014 12:55 PM, "Robert Yang" <liezhi.yang@windriver.com> wrote:
>
> On 08/19/2014 07:42 PM, Paul Barker wrote:
>>
>> Looking into the rpcbind package, the useradd commands are performed in a
>> preinst script so I don't think the problem is opkg running the script
too
>> early. Do other package managers guarantee that a package's dependencies
are
>> installed before the preinst script is ran? If so, I may need to
re-order things
>
>
> For rpm, I think yes ? The "pre" depends on base-passwd:
> $ rpm -qpR -v tmp/deploy/rpm/core2_64/rpcbind-0.2.1-r0.core2_64.rpm |
grep base-pass
> manual: base-passwd
> pre: base-passwd
> post: base-passwd
> preun: base-passwd
> postun: base-passwd
>
> But I can't find such info in ipk.
>

Ok, looking at the opkg code it should satisfy dependencies before running
the preinst script. I'll have to look into this further later and find out
exactly what is going wrong.

-- 
(Sent from mobile)

Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

--20cf307c9fcaa673250500fbb93d
Content-Type: text/html; charset=UTF-8

<p dir="ltr">On Aug 19, 2014 12:55 PM, &quot;Robert Yang&quot; &lt;<a href="mailto:liezhi.yang@windriver.com">liezhi.yang@windriver.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On 08/19/2014 07:42 PM, Paul Barker wrote:<br>
&gt;&gt;<br>
&gt;&gt; Looking into the rpcbind package, the useradd commands are performed in a<br>
&gt;&gt; preinst script so I don&#39;t think the problem is opkg running the script too<br>
&gt;&gt; early. Do other package managers guarantee that a package&#39;s dependencies are<br>
&gt;&gt; installed before the preinst script is ran? If so, I may need to re-order things<br>
&gt;<br>
&gt;<br>
&gt; For rpm, I think yes ? The &quot;pre&quot; depends on base-passwd:<br>
&gt; $ rpm -qpR -v tmp/deploy/rpm/core2_64/rpcbind-0.2.1-r0.core2_64.rpm | grep base-pass<br>
&gt; manual: base-passwd<br>
&gt; pre: base-passwd<br>
&gt; post: base-passwd<br>
&gt; preun: base-passwd<br>
&gt; postun: base-passwd<br>
&gt;<br>
&gt; But I can&#39;t find such info in ipk.<br>
&gt;</p>
<p dir="ltr">Ok, looking at the opkg code it should satisfy dependencies before running the preinst script. I&#39;ll have to look into this further later and find out exactly what is going wrong.</p>
<p dir="ltr">-- <br>
(Sent from mobile)</p>
<p dir="ltr">Paul Barker</p>
<p dir="ltr">Email: <a href="mailto:paul@paulbarker.me.uk">paul@paulbarker.me.uk</a><br>
<a href="http://www.paulbarker.me.uk">http://www.paulbarker.me.uk</a></p>

--20cf307c9fcaa673250500fbb93d--
