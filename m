Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 58BF2782A6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Nov 2017 10:21:47 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id v21so26220950ioi.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Nov 2017 02:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=118HGxCnx5TE4ExnlvVol41Z+ZsAilsa9n2rzyqc/T4=;
	b=PHvo5TwHlJq61AUt8C9CNX0y5ovV9f5xpgJJrGHr5i9amVHHeKKY4egOy2uSsfo0/9
	YPGGe6UVTwBpvUct60pLcrzhxIFpKZzC7MwhuHjYvZknSAnn2uypUEOwj6DNKP9lsYj3
	0PhIDY7LGN0C7Yvab19c1VMzPIzPrjYrLYVsrEl2WAiIm1jSRbv7vyO90Lkr+2x2zHty
	k/PcfRtGGjfoVk/X8vol+0gLmF2GnLjkSNf8/h4xub6qB+dk74UU62xqgI0dhQ8BTurN
	Tt5dqeMDERH7gK02f36yXkTLSMaIyYqt8eNa382Uou48P9kY4/zo+bnL+udqLRo5t+ml
	gUkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=118HGxCnx5TE4ExnlvVol41Z+ZsAilsa9n2rzyqc/T4=;
	b=I5eBfGdh9i4KnfrH8nHgx5yYaSPmP5GKI7Et0xupSx5RJVcAKye7/NnGOxQF6orYgR
	MWc3mF7fQqfjJMtyLJxE4EuMxkMgD4y5cHKWI8jz9LoraB993qxE9a4d6e/f/l38bFXH
	qU12XAaa0KC2H8TWcb+9rIYoQ3b4+UaBO0pg4e37HHyS7E968duIf8NDfNdp1ShqUTWV
	fs1fWcJITFnjlifycfMpGZ4HJRi/GtvWXvGX7Bwvi63oSwZNr4/nFbxc1mrozara7alJ
	wME1jYFicLcja+aydyQSXTu6d6IJefDD515WW+sNpp2tUr6D4mghNsOpmkpbBxUKxXBZ
	/63Q==
X-Gm-Message-State: AJaThX5hGi/v++JOM/7oH4EYyGpI/CiTf3JW1W45VI+ErOOZ9fAURPiU
	sLX1PwuRK0kO6svdK4reIsQuh5FaVUAFF3t1EbeQ8w==
X-Google-Smtp-Source: AGs4zMZJh+lVgXgUHx8NHeZWsInqrGwYWXDz2TA5r//2ERgJkePRxiur3JiOtLrMpC1CBBXYjrzT0nPDsKDGIjPiwyw=
X-Received: by 10.107.47.1 with SMTP id j1mr19686469ioo.217.1511432509009;
	Thu, 23 Nov 2017 02:21:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.132 with HTTP; Thu, 23 Nov 2017 02:21:28 -0800 (PST)
In-Reply-To: <35dc23c8-a8af-65ca-8cdf-5152b76d98c0@linux.intel.com>
References: <20171122160414.14093-1-ross.burton@intel.com>
	<20171122160414.14093-3-ross.burton@intel.com>
	<35dc23c8-a8af-65ca-8cdf-5152b76d98c0@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 23 Nov 2017 10:21:28 +0000
Message-ID: <CAJTo0LY1LBR5XyVERkDiPJBokCeLLKxH4X38D4x1tuj+eZFTPA@mail.gmail.com>
To: Joshua Lock <joshua.g.lock@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] oeqa/selftest/runtime_test: simplify postinst testing
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
X-List-Received-Date: Thu, 23 Nov 2017 10:21:48 -0000
Content-Type: multipart/alternative; boundary="001a11377fbccd4d38055ea3cdcb"

--001a11377fbccd4d38055ea3cdcb
Content-Type: text/plain; charset="UTF-8"

On 23 November 2017 at 01:34, Joshua Lock <joshua.g.lock@linux.intel.com>
wrote:

>       @OETestID(1540)
>>
>
> We're effectively stating that test ID 1540 and test ID 1545 are both
> covered by the same test method, right?
>
> Perhaps we don't need to maintain both test cases in Testopia, as we'll
> only ever see both tests pass or fail?


Yes, reviewing and sanitising testopia was my next job.

-                    features = 'MACHINE = "qemux86"\n'
>> -                    features += 'CORE_IMAGE_EXTRA_INSTALL += "%s %s
>> "\n'% (rootfs_pkg, boot_pkg)
>> +                    features = 'CORE_IMAGE_EXTRA_INSTALL =
>> "postinst-delayed-b"\n'
>>                       features += 'IMAGE_FEATURES += "package-management
>> empty-root-password"\n'
>>
>
> The indentation doesn't look right here?


That would be Atom "helpfully" doing smart intentation.  I'll fix it up in
something else, thanks.


> +                            status, output = qemu.run_serial("test -f %s
>> && echo found" % os.path.join(targettestdir, filename))
>> +                            self.assertEqual(output, "found", "%s was
>> not present on boot" % filename)
>>
>>
> Why not just test the status (return code of test -f) instead of echoing a
> known value? i.e.
>
> self.assertEqual(status, 0, "%s was not present on boot" % filename)


Because run_serial() is a bit lame and I don't trust it to correctly report
the exit status.   Rewriting it is on my hitlist, yes.

Ross

--001a11377fbccd4d38055ea3cdcb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 23 November 2017 at 01:34, Joshua Lock <span dir=3D"ltr=
">&lt;<a href=3D"mailto:joshua.g.lock@linux.intel.com" target=3D"_blank">jo=
shua.g.lock@linux.intel.com</a>&gt;</span> wrote:<br><div class=3D"gmail_ex=
tra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;bord=
er-left-color:rgb(204,204,204);padding-left:1ex"><span class=3D"gmail-"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);padd=
ing-left:1ex">=C2=A0 =C2=A0 =C2=A0 @OETestID(1540)<br>
</blockquote>
<br></span>
We&#39;re effectively stating that test ID 1540 and test ID 1545 are both c=
overed by the same test method, right?<br>
<br>
Perhaps we don&#39;t need to maintain both test cases in Testopia, as we&#3=
9;ll only ever see both tests pass or fail?</blockquote><div><br></div><div=
>Yes, reviewing and sanitising testopia was my next job.</div><div><br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204)=
;padding-left:1ex"><div><div class=3D"gmail-h5"><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-=
style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">-=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 features =3D=
 &#39;MACHINE =3D &quot;qemux86&quot;\n&#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 feat=
ures +=3D &#39;CORE_IMAGE_EXTRA_INSTALL +=3D &quot;%s %s &quot;\n&#39;% (ro=
otfs_pkg, boot_pkg)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 feat=
ures =3D &#39;CORE_IMAGE_EXTRA_INSTALL =3D &quot;postinst-delayed-b&quot;\n=
&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 features +=3D &#39;IMAGE_FEATURES +=3D &quot;package-management empty-r=
oot-password&quot;\n&#39;<br>
</blockquote>
<br></div></div>
The indentation doesn&#39;t look right here?</blockquote><div><br></div><di=
v>That would be Atom &quot;helpfully&quot; doing smart intentation.=C2=A0 I=
&#39;ll fix it up in something else, thanks.</div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wid=
th:1px;border-left-style:solid;border-left-color:rgb(204,204,204);padding-l=
eft:1ex"><span class=3D"gmail-">
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);p=
adding-left:1ex">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status, output =3D qemu.run_seria=
l(&quot;test -f %s &amp;&amp; echo found&quot; % os.path.join(targettestdir=
, filename))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(output, &quot;found&quot;, &quot;=
%s was not present on boot&quot; % filename)<br>
<br>
</blockquote>
<br></span>
Why not just test the status (return code of test -f) instead of echoing a =
known value? i.e.<br>
<br>
self.assertEqual(status, 0, &quot;%s was not present on boot&quot; % filena=
me)</blockquote><div><br></div><div>Because run_serial() is a bit lame and =
I don&#39;t trust it to correctly report the exit status. =C2=A0 Rewriting =
it is on my hitlist, yes.</div><div><br></div><div>Ross</div></div></div></=
div>

--001a11377fbccd4d38055ea3cdcb--
