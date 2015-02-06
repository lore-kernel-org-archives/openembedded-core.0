Return-Path: <andrei@gherzan.ro>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id 32178605F1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Feb 2015 23:23:23 +0000 (UTC)
Received: by mail-we0-f176.google.com with SMTP id p10so5010381wes.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Feb 2015 15:23:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=rFjVVM6kUs4Q3xST7CZ9EP2fsl4rGUnZOQCcLV6QrqU=;
	b=Aj06aSR9EfiobA1nZY2pJ4v7rucYMxljjgunZVT31YwUZftAzYYeidfw1KXziQDHSM
	bwvHDAjWkZyXacAJsOfGlrbI/gZQcn7g796PdgVEXXb6hUKKs/6O7V97db6W2R4ml8zj
	HAQzw9p1UNKRk6NFuxC0djPo3MaHT7OqOMc3bdqz4XPn98u6YVM/b3FIKw/+kDdCKpBf
	BPi2DZFQ2DAVhi0yjgA+ZZGo+c2PrsokERPKGiktwuLnETbS1bkIxGLUC/4peMR0Qvl1
	eYGV/hC4yoca12H/N056prNzcxT/o/K2PUhUOB7PzGJ18/xucXwXXyh5IMiPasyR7Bwd
	C/nQ==
X-Gm-Message-State: ALoCoQkSUTni9+IcDBZdfJ+f3sZDqdjXZGrcUJYhOMPt9TJvTvqG3VvxoRP2mb9yF0Lu+3LD08XE
X-Received: by 10.180.104.228 with SMTP id gh4mr8361853wib.63.1423265004518;
	Fri, 06 Feb 2015 15:23:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.217.162.2 with HTTP; Fri, 6 Feb 2015 15:23:04 -0800 (PST)
X-Originating-IP: [195.249.186.165]
In-Reply-To: <1570155.OaRLeKE1VZ@peggleto-mobl5.ger.corp.intel.com>
References: <CAK18fxFLTqDLfWp1rz+56BUY0M05KnQZgMfRO70VTnt+m8Vp0Q@mail.gmail.com>
	<1570155.OaRLeKE1VZ@peggleto-mobl5.ger.corp.intel.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Sat, 7 Feb 2015 01:23:04 +0200
Message-ID: <CAK18fxG-FaHKhLntuc9XUtvG_ttVLC_k_SVN7Fnvmap+RAZwwA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: libpng 1.6.16 fetch fails
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
X-List-Received-Date: Fri, 06 Feb 2015 23:23:32 -0000
Content-Type: multipart/alternative; boundary=f46d04428d1004136b050e73b538

--f46d04428d1004136b050e73b538
Content-Type: text/plain; charset=UTF-8

Hi Paul,

On Mon, Feb 2, 2015 at 7:00 PM, Paul Eggleton <paul.eggleton@linux.intel.com
> wrote:

> Hi Andrei,
>
> On Friday 30 January 2015 21:23:14 Andrei Gherzan wrote:
> > After the latest libpng update, the source link seems broken.
> >
> > WARNING: Checksum failure encountered with download of
> >
> http://downloads.sourceforge.net/project/libpng/libpng16/1.6.16/libpng-1.6.1
> > 6.tar.xz - will attempt other sources if available
> > WARNING: Renaming
> > /home/agherzan/work/personal/yocto/downloads/libpng-1.6.16.tar.xz to
> >
> /home/agherzan/work/personal/yocto/downloads/libpng-1.6.16.tar.xz_bad-checks
> > um_b2e23b153fad3034ec48336f81eefd33 ERROR: Fetcher failure for URL: '
> >
> http://downloads.sourceforge.net/project/libpng/libpng16/1.6.16/libpng-1.6.1
> > 6.tar.xz'. Checksum mismatch!
>
> I just tried bitbake -c cleanall libpng; bitbake -c fetch libpng and it
> works
> here, as does using wget directly on the URL you pasted above. Are you sure
> this wasn't an intermittent error? Alternatively are you behind a firewall
> or
> proxy which is blocking the download?
>

It was something temporary and not reproducible anymore. Maybe they had
like a temporary issue. Thanks anyway and sorry for disturbing.


-- 
*Andrei Gherzan*

--f46d04428d1004136b050e73b538
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Paul,<br><div class=3D"gmail_extra"><br><div class=3D"g=
mail_quote">On Mon, Feb 2, 2015 at 7:00 PM, Paul Eggleton <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">pau=
l.eggleton@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">Hi Andrei,<br>
<span class=3D""><br>
On Friday 30 January 2015 21:23:14 Andrei Gherzan wrote:<br>
&gt; After the latest libpng update, the source link seems broken.<br>
&gt;<br>
&gt; WARNING: Checksum failure encountered with download of<br>
&gt; <a href=3D"http://downloads.sourceforge.net/project/libpng/libpng16/1.=
6.16/libpng-1.6.1" target=3D"_blank">http://downloads.sourceforge.net/proje=
ct/libpng/libpng16/1.6.16/libpng-1.6.1</a><br>
&gt; 6.tar.xz - will attempt other sources if available<br>
&gt; WARNING: Renaming<br>
&gt; /home/agherzan/work/personal/yocto/downloads/libpng-1.6.16.tar.xz to<b=
r>
&gt; /home/agherzan/work/personal/yocto/downloads/libpng-1.6.16.tar.xz_bad-=
checks<br>
</span>&gt; um_b2e23b153fad3034ec48336f81eefd33 ERROR: Fetcher failure for =
URL: &#39;<br>
<span class=3D"">&gt; <a href=3D"http://downloads.sourceforge.net/project/l=
ibpng/libpng16/1.6.16/libpng-1.6.1" target=3D"_blank">http://downloads.sour=
ceforge.net/project/libpng/libpng16/1.6.16/libpng-1.6.1</a><br>
&gt; 6.tar.xz&#39;. Checksum mismatch!<br>
<br>
</span>I just tried bitbake -c cleanall libpng; bitbake -c fetch libpng and=
 it works<br>
here, as does using wget directly on the URL you pasted above. Are you sure=
<br>
this wasn&#39;t an intermittent error? Alternatively are you behind a firew=
all or<br>
proxy which is blocking the download?<br></blockquote><div><br></div><div>I=
t was something temporary and not reproducible anymore. Maybe they had like=
 a temporary issue. Thanks anyway and sorry for disturbing.=C2=A0</div></di=
v><br clear=3D"all"><div><br></div>-- <br><div class=3D"gmail_signature"><d=
iv dir=3D"ltr"><div style=3D"text-align:center"></div><div style=3D"text-al=
ign:center"><div align=3D"left"><b style=3D"font-family:Arial;font-size:sma=
ll;color:rgb(51,51,51);text-align:center">Andrei Gherzan</b><br></div></div=
></div></div>
</div></div>

--f46d04428d1004136b050e73b538--
