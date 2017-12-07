Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f52.google.com (mail-pg0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 55B9777BEB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Dec 2017 01:44:43 +0000 (UTC)
Received: by mail-pg0-f52.google.com with SMTP id j4so3327409pgp.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Dec 2017 17:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UTvMc8Dw5rXgZKmuAMqzpXeIuHse67POYjZetGdpBbc=;
	b=kprmkIoFC0Oq3y2Yn7RWLnVr4xjf+vcdSHDQdv4RHFmNps/Kaep0GaQNIXRdBV9Hno
	NmlsPL7Jgic/+S+EnfyTiEtxBj56+NPU3xTptKAKybm9RejqaxDs27P48bDXxTunuefU
	+GAoz3XVTEP6WbW76wV8nJyn37ounGYIynbWp6iykAdnIFLPjRgv/cX6DQGtj2gz1lfq
	kRHZNpdEeYv3UdF9AArPkSzfMyxIx6VJFMwHpkoBjkYN9uco4k4ej79lsOYfOXfFUQT2
	PkZU2q9VfBxW7mR17WXXuvG30zQclMCoWJXcXqXMjPnxwIWIa2NpKQHxXCL5YNNBdH+z
	gbBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UTvMc8Dw5rXgZKmuAMqzpXeIuHse67POYjZetGdpBbc=;
	b=IMSLRWjZ+SfjwiyJ+6pRspRGOertRBFLI8a+fZuUIpghm3o5JbiAwsR9m4pkkrLF81
	wNjVoeHXwurgpyM2b+6lexp4rPrJXRUCAGmlPvwKR49elmfuHuwkm+pP93W2RL7i3tvR
	QaJdyHi9fJu398xWlzulmybw/ZSozHUZqwle+BmXrQbMhUkv8slrLb38vpDfWwBdTDxW
	OELTKM5JqMdZfWfqFOKAJTQHB2L1c6fxXhLwLTV5vCaTiGzcGPrbZK2zX1kq+x83V5E8
	rdxBB7mzoDPemfk0V2C1ybq7nYy8TX4F2SjF3vOf83jwC0uKB9rJYDBVBpnm6qUZ82t4
	kVMA==
X-Gm-Message-State: AJaThX66wl8/E8HByfwo3zcxnvGkTWCVIVuSY1xFiOM+FtcKcrd6+Pr5
	PgbuVg9C6R9CiKYtSLKETXcMl5V4py28xLhMdzg=
X-Google-Smtp-Source: AGs4zMZVLWoW/l+LZCaaoahWJNcxoEXVMGjdO5n0U8DbgULxOxgg2mxtmR+ClFIPMNjxnzq5pzgrKSUZvg0gVyDBA0M=
X-Received: by 10.101.73.203 with SMTP id t11mr23166117pgs.446.1512611084530; 
	Wed, 06 Dec 2017 17:44:44 -0800 (PST)
MIME-Version: 1.0
References: <1511932233-21738-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<b825822d-713c-d31a-e071-bf0733555040@linux.intel.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF732EEA4D08@G08CNEXMBPEKD01.g08.fujitsu.local>
	<CAJTo0LYNCDPA89HsgcoZqjoqF2OBuKDGGXA8pDgC9jGsgtwQ8g@mail.gmail.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF732EEA5691@G08CNEXMBPEKD01.g08.fujitsu.local>
In-Reply-To: <33D4DBCAC5F2D74E96B07F6E7632BF732EEA5691@G08CNEXMBPEKD01.g08.fujitsu.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 07 Dec 2017 01:44:33 +0000
Message-ID: <CAMKF1spP4ZrDTSY_O6f+FMPuYap_6tEPkAK9K3-jJZeqBEDP7w@mail.gmail.com>
To: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libyui
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
X-List-Received-Date: Thu, 07 Dec 2017 01:44:43 -0000
Content-Type: multipart/alternative; boundary="089e0821f13c607838055fb6368c"

--089e0821f13c607838055fb6368c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Meta-oe

On Wed, Dec 6, 2017 at 5:26 PM Zheng, Ruoqin <zhengrq.fnst@cn.fujitsu.com>
wrote:

> Hi Ross!
>
>          Where should I put this recipe?
>
> --------------------------------------------------
>
> Zheng Ruoqin
>
> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST)
>
> ADDR.: No.6 Wenzhu Road, Software Avenue,
>
>        Nanjing, 210012, China
>
> MAIL : zhengrq.fnst@cn.fujistu.com
>
>
>
> *From:* Burton, Ross [mailto:ross.burton@intel.com]
> *Sent:* Monday, December 04, 2017 6:17 PM
> *To:* Zheng, Ruoqin/=E9=83=91 =E8=8B=A5=E9=92=A6 <zhengrq.fnst@cn.fujitsu=
.com>
> *Cc:* Alexander Kanavin <alexander.kanavin@linux.intel.com>;
> openembedded-core@lists.openembedded.org
>
>
> *Subject:* Re: [OE-core] [PATCH] libyui
>
>
>
> Again, it sounds like this should be in another layer.
>
>
>
> Ross
>
>
>
> On 4 December 2017 at 02:01, Zheng, Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> wrote:
>
> Hi Alex:
>    I attend to make dnfdragora(which is a gui for dnf) used in oe-core,
> and libyui is the depend of dnfdragora.
>
> --------------------------------------------------
> Zheng Ruoqin
> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST)
> ADDR.: No.6 Wenzhu Road, Software Avenue,
>        Nanjing, 210012, China
> MAIL : zhengrq.fnst@cn.fujistu.com
>
>
>
> -----Original Message-----
> From: Alexander Kanavin [mailto:alexander.kanavin@linux.intel.com]
> Sent: Wednesday, November 29, 2017 2:48 PM
> To: Zheng, Ruoqin/=E9=83=91 =E8=8B=A5=E9=92=A6 <zhengrq.fnst@cn.fujitsu.c=
om>;
> openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] libyui
>
> On 11/29/2017 07:10 AM, zhengrq wrote:
> > Add a new recipe libyui.
>
>
> Add why? What does it do? Why should it be in oe-core?
>
> Alex
>
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--089e0821f13c607838055fb6368c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Meta-oe</div><br><div class=3D"gmail_quote"><div>On =
Wed, Dec 6, 2017 at 5:26 PM Zheng, Ruoqin &lt;<a href=3D"mailto:zhengrq.fns=
t@cn.fujitsu.com">zhengrq.fnst@cn.fujitsu.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">





<div lang=3D"ZH-CN" link=3D"blue" vlink=3D"purple">
<div class=3D"m_1706872068890280091WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi</span><span lang=3D"EN-US" s=
tyle=3D"font-size:10.5pt;font-family:&quot;Calibri&quot;,sans-serif;color:#=
1f497d">
</span><span lang=3D"EN-US">Ross!<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#1f497d">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0
</span><span lang=3D"EN-US">=C2=A0Where should I put this recipe?</span><sp=
an lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Calibri&quot;=
,sans-serif;color:#1f497d"><u></u><u></u></span></p></div></div><div lang=
=3D"ZH-CN" link=3D"blue" vlink=3D"purple"><div class=3D"m_17068720688902800=
91WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#1f497d"><u></u><u></u></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#1f497d">----------------------=
----------------------------<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#1f497d">Zheng Ruoqin<u></u><u>=
</u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#1f497d">Nanjing Fujitsu Nanda =
Software Tech. Co., Ltd.(FNST)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#1f497d">ADDR.: No.6 Wenzhu Roa=
d, Software Avenue,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#1f497d">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Nanjing, 210012, China<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#1f497d">MAIL : <a href=3D"mail=
to:zhengrq.fnst@cn.fujistu.com" target=3D"_blank">zhengrq.fnst@cn.fujistu.c=
om</a><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></=
span></p>
</div></div><div lang=3D"ZH-CN" link=3D"blue" vlink=3D"purple"><div class=
=3D"m_1706872068890280091WordSection1"><p class=3D"MsoNormal"><b><span lang=
=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-s=
erif">From:</span></b><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-f=
amily:&quot;Calibri&quot;,sans-serif"> Burton, Ross [mailto:<a href=3D"mail=
to:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>]
<br>
<b>Sent:</b> Monday, December 04, 2017 6:17 PM<br>
<b>To:</b> Zheng, Ruoqin/</span><span style=3D"font-size:11.0pt">=E9=83=91<=
/span><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-=
serif">
</span><span style=3D"font-size:11.0pt">=E8=8B=A5=E9=92=A6</span><span lang=
=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-s=
erif"> &lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.com" target=3D"_blank"=
>zhengrq.fnst@cn.fujitsu.com</a>&gt;<br>
<b>Cc:</b> Alexander Kanavin &lt;<a href=3D"mailto:alexander.kanavin@linux.=
intel.com" target=3D"_blank">alexander.kanavin@linux.intel.com</a>&gt;; <a =
href=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"_blank">=
openembedded-core@lists.openembedded.org</a></span></p></div></div><div lan=
g=3D"ZH-CN" link=3D"blue" vlink=3D"purple"><div class=3D"m_1706872068890280=
091WordSection1"><p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-=
size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif"><br>
<b>Subject:</b> Re: [OE-core] [PATCH] libyui<u></u><u></u></span></p></div>=
</div><div lang=3D"ZH-CN" link=3D"blue" vlink=3D"purple"><div class=3D"m_17=
06872068890280091WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Again, it sounds like this shou=
ld be in another layer.<u></u><u></u></span></p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Ross<u></u><u></u></span></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">On 4 December 2017 at 02:01, Zh=
eng, Ruoqin &lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.com" target=3D"_b=
lank">zhengrq.fnst@cn.fujitsu.com</a>&gt; wrote:<u></u><u></u></span></p>
<blockquote style=3D"border:none;border-left:solid #cccccc 1.0pt;padding:0c=
m 0cm 0cm 6.0pt;margin-left:4.8pt;margin-right:0cm">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi Alex:<br>
=C2=A0 =C2=A0I attend to make dnfdragora(which is a gui for dnf) used in oe=
-core, and libyui is the depend of dnfdragora.<br>
<br>
--------------------------------------------------<br>
Zheng Ruoqin<br>
Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST)<br>
ADDR.: No.6 Wenzhu Road, Software Avenue,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0Nanjing, 210012, China<br>
MAIL : <a href=3D"mailto:zhengrq.fnst@cn.fujistu.com" target=3D"_blank">zhe=
ngrq.fnst@cn.fujistu.com</a><u></u><u></u></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><br>
<br>
-----Original Message-----<br>
From: Alexander Kanavin [mailto:<a href=3D"mailto:alexander.kanavin@linux.i=
ntel.com" target=3D"_blank">alexander.kanavin@linux.intel.com</a>]<br>
Sent: Wednesday, November 29, 2017 2:48 PM<br>
To: Zheng, Ruoqin/</span>=E9=83=91 =E8=8B=A5=E9=92=A6<span lang=3D"EN-US"> =
&lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.com" target=3D"_blank">zhengr=
q.fnst@cn.fujitsu.com</a>&gt;;
<a href=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"_blan=
k">openembedded-core@lists.openembedded.org</a><br>
Subject: Re: [OE-core] [PATCH] libyui<br>
<br>
On 11/29/2017 07:10 AM, zhengrq wrote:<br>
&gt; Add a new recipe libyui.<br>
<br>
<br>
Add why? What does it do? Why should it be in oe-core?<br>
<br>
Alex<br>
<br>
<br>
<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><u></u><u></u></span></p>
</div>
</div>
</blockquote>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
</div></div>

--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--089e0821f13c607838055fb6368c--
