Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id B8F8E73CC7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 17:43:47 +0000 (UTC)
Received: by igfj19 with SMTP id j19so114067259igf.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 10:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=ORbVvuyywwegSOjfN0ofJT2XRmCkxSXikJYr/i6rNzs=;
	b=0Nsf4VG4KPakYdOHkt+Lpchcw2+sg+0ZC+8FFCSljl8GDJYOJRASDdhFK19XAi2IBW
	///yQtJBJYajT5BeWwfOGUB7bBU1sGrEUNC6Hj+w3+5bIT4BNYl+lH98rUElWeRA4s11
	KLDAO1ku59gjghN3VN/CVR2H5U2mT8opFoDaJIwj8qZqkbCM0AE4tQMVCVNX/mBHwGSu
	vPSpyTMAM+aeAh9InfqWRyHJqfqMUYE7ThidOUVRZyYu2LIGTFk8hV/SlxzbP8Ge1YeK
	/w87M0KDIdJbp/s5uhwdboEWBu04OoFY7r2AnjEBR1wFUhZdbBzFky6XgNeja6CpQbt0
	XOFQ==
X-Received: by 10.50.138.76 with SMTP id qo12mr3284048igb.38.1440006227281;
	Wed, 19 Aug 2015 10:43:47 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.118.150 with HTTP; Wed, 19 Aug 2015 10:43:27 -0700 (PDT)
In-Reply-To: <CAJTo0LZLL+ui3GEG7HeC7y+JxWdmBXaYwWEzbQB3DZU3ypfckw@mail.gmail.com>
References: <365E1805BC95084CBE82381A0B869994E73E4FE9@EU-MBX-03.mgc.mentorg.com>
	<969F26A8BAB325438E7EB80D3C3134FB16CFA7F5@IRSMSX105.ger.corp.intel.com>
	<CAP71WjyESzCxJrJsxgSk0ZxnM8q0tQYU+CFmm-QVQGVouYWB+A@mail.gmail.com>
	<CABcZANkgxRSRA9afEaOD0cpeNzzSAti_Ef9D4V4ThoJkQzwmgg@mail.gmail.com>
	<CABcZANmjXndEm+OF8aKvSgHwkiOMuFgHrrJy97CYLpDNtZxCmg@mail.gmail.com>
	<CABcZAN==rSZ2M4f_2-eZ5yvAaHV+k=rC8pgRju425151ijWMZw@mail.gmail.com>
	<20150819071002.GA10916@ad.chargestorm.se>
	<CAJTo0LaoZcQ+398vYS-iaVssQnAVHr0cJCY4izC8=T73nWy4rQ@mail.gmail.com>
	<CAP9ODKok+TydzwtDA7o9YRS_tVEqffMPWAJtgPPPsbAjv5XpBA@mail.gmail.com>
	<CAJTo0LZLL+ui3GEG7HeC7y+JxWdmBXaYwWEzbQB3DZU3ypfckw@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 19 Aug 2015 10:43:27 -0700
X-Google-Sender-Auth: 0EklnbNC-mGlmwg0yhRg7yE3Ago
Message-ID: <CABcZANmxXgLG7HCxedbXq=1KcwOcbY-CJV4fF1gcB_TNweSEug@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: iw in place of wireless-tools
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
X-List-Received-Date: Wed, 19 Aug 2015 17:43:47 -0000
Content-Type: multipart/alternative; boundary=001a1134b964a6f78a051dad9314

--001a1134b964a6f78a051dad9314
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 19, 2015 at 4:56 AM, Burton, Ross <ross.burton@intel.com> wrote:

> On 19 August 2015 at 12:35, Otavio Salvador <
> otavio.salvador@ossystems.com.br> wrote:
>
>> Em 19/08/2015 12:26, "Burton, Ross" <ross.burton@intel.com> escreveu:
>> >
>> > And now for the elephant in the room: is anyone going to work on this?
>> :)
>>
>> I can ask our people to work on this.
>>
>> Is there a bug number to assign for me?
>>
> Not as far as I'm aware.  Note that M3 cut-off is fairly soon (August 23rd,
> technically) and this would count as a Feature so switching to iw would be
> out of scope for M4.


While we're at it, we should enable ip/ss/etc in busybox and decide whether
to keep netstat/ifconfig/route enabled there alongside them (I'd vote no,
personally, but don't feel very strongly about it), and drop net-tools from
full tools packagegroups in favor of iproute2.

If nobody else gets to it, I might be able to find the time.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1134b964a6f78a051dad9314
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On W=
ed, Aug 19, 2015 at 4:56 AM, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"=
mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div><div>On 19 August 2=
015 at 12:35, Otavio Salvador <span dir=3D"ltr">&lt;<a href=3D"mailto:otavi=
o.salvador@ossystems.com.br" target=3D"_blank">otavio.salvador@ossystems.co=
m.br</a>&gt;</span> wrote:<div class=3D"gmail_quote"><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex"><p dir=3D"ltr"><span>
Em 19/08/2015 12:26, &quot;Burton, Ross&quot; &lt;<a href=3D"mailto:ross.bu=
rton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt; escreveu:<b=
r>
&gt;<br></span><span>
&gt; And now for the elephant in the room: is anyone going to work on this?=
 :)</span></p>
<p dir=3D"ltr">I can ask our people to work on this.</p>
<p dir=3D"ltr">Is there a bug number to assign for me?<br>
</p>
</blockquote></div></div></div>Not as far as I&#39;m aware.=C2=A0 Note that=
 M3 cut-off is fairly soon (<span><span>August 23rd</span></span>, technica=
lly) and this would count as a Feature so switching to iw would be out of s=
cope for M4.</blockquote></div><br>While we&#39;re at it, we should enable =
ip/ss/etc in busybox and decide whether to keep netstat/ifconfig/route enab=
led there alongside them (I&#39;d vote no, personally, but don&#39;t feel v=
ery strongly about it), and drop net-tools from full tools packagegroups in=
 favor of iproute2.</div><div class=3D"gmail_extra"><br></div><div class=3D=
"gmail_extra">If nobody else gets to it, I might be able to find the time.<=
br>-- <br><div>Christopher Larson<br>clarson at kergoth dot com<br>Founder =
- BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Softwar=
e Engineer, Mentor Graphics</div>
</div></div>

--001a1134b964a6f78a051dad9314--
