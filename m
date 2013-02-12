Received: from mail-vb0-f42.google.com ([209.85.212.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1U5DNJ-00070N-EJ
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 11:46:10 +0100
Received: by mail-vb0-f42.google.com with SMTP id ff1so84243vbb.29
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2013 02:30:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:x-originating-ip:in-reply-to:references
	:from:date:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=EfigOXcfIc/ITOyAB/ToVXUnKqmfr878NwbtQGFjQoU=;
	b=fKbZp3u7kZbHKwZIMb8FyiP0aWtayw6BKAWvTNvxkalmHz7YjQ7yJDNjWk22Azoquy
	OpCyvaD16HbaGp4wZ2wTRRCP7H/JhUm2jqBozei9WLuLO8WL0q5QyeCX/LEStseoob+f
	PG/p4tEIYpXXhaLC+Wq9E9M/65knDE5pGlYMi7YYOEKqt3pTwFldkm1I19Kug4KlJlTe
	95xHKbStJv1nlTA5Z/F8VXV8rDBbFZeVoJbwaZdFQ68mSJOQQxOSatd2Pex2zBWR9BAu
	K49VkbH2s8t2XpodutibSUyr8i2NakGSz/fnT7MMvzF4cWXLq070K3ISBh4KEskEcp5u
	Y3JA==
X-Received: by 10.52.20.177 with SMTP id o17mr5853257vde.17.1360665009680;
	Tue, 12 Feb 2013 02:30:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.229.195 with HTTP; Tue, 12 Feb 2013 02:29:49 -0800 (PST)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <511A176D.2020207@yoctoproject.org>
References: <50D17BD22A23EE4A887974F6B5882038855FB4BE@ALA-MBB.corp.ad.wrs.com>
	<CAK18fxFaVeETyzWOCK0j3q3iVZUZxygbwoiREPcK-jfbsWNAjg@mail.gmail.com>
	<3827804.EL3IkEV3FJ@helios>
	<CAK18fxFJBGM5=bqy=LJuYff0XbSdpTR5poyHLpCs4ySNFcGBTQ@mail.gmail.com>
	<511A176D.2020207@yoctoproject.org>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Tue, 12 Feb 2013 12:29:49 +0200
Message-ID: <CAK18fxGS9FUYqmQKKGLfntowOUgnCfKwdbQYvgm9tbAMkaPURw@mail.gmail.com>
To: Michael Halstead <michael@yoctoproject.org>
X-Gm-Message-State: ALoCoQnUpV3iNWwhTcRKOyaZYNklzuV0D+6EIzS4oZpAx8Mg7tH2I0bOoEY4SpuUEKObUtnHd1oe
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: [denzil] qt 4.8.0 is not available from source anymore
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Feb 2013 10:46:13 -0000
Content-Type: multipart/alternative; boundary=20cf307ca1e48f708c04d584823a

--20cf307ca1e48f708c04d584823a
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 12, 2013 at 12:20 PM, Michael Halstead <michael@yoctoproject.org
> wrote:

>
>  On 02/11/2013 06:57 AM, Andrei Gherzan wrote:
>
>
>
>
> On Mon, Feb 11, 2013 at 4:43 PM, Paul Eggleton <
> paul.eggleton@linux.intel.com> wrote:
>
>> On Monday 11 February 2013 16:01:10 Andrei Gherzan wrote:
>> > On Mon, Feb 11, 2013 at 3:10 PM, Sarbu, Florin-Ionut (Florin) <
>> > Florin.Sarbu@windriver.com> wrote:
>>  > > On Monday, February 11, 2013 02:51 AM Andrei Gherzan wrote:
>> > > >
>> > > > In denzil SRC_URI for qt4.8.0 uses:
>> > > >
>> http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.g
>> > > > z
>> > > >
>> > > >  This source seems to be outdated and replaced by:
>> > > > http://releases.qt-project.org/qt4/source/
>> > > >
>> > > >  The problem is that the new location doesn't include the 4.8.0
>> release.
>> > > >  qt-everywhere-opensource-src-4.6.4.tar.gz
>> > > >  qt-everywhere-opensource-src-4.8.1.tar.gz
>> > > >  qt-everywhere-opensource-src-4.8.2.tar.gz
>> > > >  qt-everywhere-opensource-src-4.8.3.tar.gz
>> > > >  qt-everywhere-opensource-src-4.8.4.tar.gz
>> > > >
>> > > >  So right now qt4 in denzil is not fetch-able anymore.
>> > >
>>  > >  Use git
>> >
>> > We are not talking about switching of sources. I want to know why 4.8.0
>> is
>> > not on yocto mirror.
>>
>>  It should be there, not sure why it isn't.
>>
>> Michael, could you please upload qt 4.8.0 and anything else downloaded by
>> "bitbake -c fetchall world" for the denzil-7.0.2 release into the mirror?
>>
>   I ran fetchall world and poky 7.0.2 uses
> qt-everywhere-opensource-src-4.7.4.tar.gz which was already present at
> http://downloads.yoctoproject.org/mirror/sources/. Every file downloaded
> was already present on the mirror.
>
> I downloaded qt-everywhere-opensource-src-4.8.0.tar.gz from a Fedora
> Project mirror and added it to
> http://downloads.yoctoproject.org/mirror/sources/ so we'd have it.
>

Thank you. 4.8.0 had default preferrence -1.

-- 
*Andrei Gherzan*
m: +40.744.478.414 |  f: +40.31.816.28.12

--20cf307ca1e48f708c04d584823a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Tue, Feb 12, 2013 at 12:20 PM, Michael Halstead <span dir=3D"ltr=
">&lt;<a href=3D"mailto:michael@yoctoproject.org" target=3D"_blank">michael=
@yoctoproject.org</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF"><div><div class=3D"h5">
    <div><br>
      <pre cols=3D"72"></pre>
      On 02/11/2013 06:57 AM, Andrei Gherzan wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <div dir=3D"ltr"><br>
        <div class=3D"gmail_extra"><br>
          <br>
          <div class=3D"gmail_quote">On Mon, Feb 11, 2013 at 4:43 PM, Paul
            Eggleton <span dir=3D"ltr">&lt;<a href=3D"mailto:paul.eggleton@=
linux.intel.com" target=3D"_blank">paul.eggleton@linux.intel.com</a>&gt;</s=
pan>
            wrote:<br>
            <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
              <div>On Monday 11 February 2013 16:01:10 Andrei
                Gherzan wrote:<br>
                &gt; On Mon, Feb 11, 2013 at 3:10 PM, Sarbu,
                Florin-Ionut (Florin) &lt;<br>
                &gt; <a href=3D"mailto:Florin.Sarbu@windriver.com" target=
=3D"_blank">Florin.Sarbu@windriver.com</a>&gt;
                wrote:<br>
              </div>
              <div>&gt; &gt; On Monday, February 11, 2013
                02:51 AM Andrei Gherzan wrote:<br>
                &gt; &gt; &gt;<br>
                &gt; &gt; &gt; In denzil SRC_URI for qt4.8.0 uses:<br>
                &gt; &gt; &gt; <a href=3D"http://get.qt.nokia.com/qt/source=
/qt-everywhere-opensource-src-$%7BPV%7D.tar.g" target=3D"_blank">http://get=
.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.g</a><br>
                &gt; &gt; &gt; z<br>
                &gt; &gt; &gt;<br>
                &gt; &gt; &gt; =A0This source seems to be outdated and
                replaced by:<br>
                &gt; &gt; &gt; <a href=3D"http://releases.qt-project.org/qt=
4/source/" target=3D"_blank">http://releases.qt-project.org/qt4/source/</a>=
<br>
                &gt; &gt; &gt;<br>
                &gt; &gt; &gt; =A0The problem is that the new location
                doesn&#39;t include the 4.8.0 release.<br>
                &gt; &gt; &gt;
                =A0qt-everywhere-opensource-src-4.6.4.tar.gz<br>
                &gt; &gt; &gt;
                =A0qt-everywhere-opensource-src-4.8.1.tar.gz<br>
                &gt; &gt; &gt;
                =A0qt-everywhere-opensource-src-4.8.2.tar.gz<br>
                &gt; &gt; &gt;
                =A0qt-everywhere-opensource-src-4.8.3.tar.gz<br>
                &gt; &gt; &gt;
                =A0qt-everywhere-opensource-src-4.8.4.tar.gz<br>
                &gt; &gt; &gt;<br>
                &gt; &gt; &gt; =A0So right now qt4 in denzil is not
                fetch-able anymore.<br>
                &gt; &gt;<br>
              </div>
              <div>&gt; &gt; =A0Use git<br>
                &gt;<br>
                &gt; We are not talking about switching of sources. I
                want to know why 4.8.0 is<br>
                &gt; not on yocto mirror.<br>
                <br>
              </div>
              It should be there, not sure why it isn&#39;t.<br>
              <br>
              Michael, could you please upload qt 4.8.0 and anything
              else downloaded by<br>
              &quot;bitbake -c fetchall world&quot; for the denzil-7.0.2 re=
lease
              into the mirror?<br>
            </blockquote>
          </div>
        </div>
      </div>
    </blockquote></div></div>
    I ran fetchall world and poky 7.0.2 uses
    qt-everywhere-opensource-src-4.7.4.tar.gz which was already present
    at <a href=3D"http://downloads.yoctoproject.org/mirror/sources/" target=
=3D"_blank">http://downloads.yoctoproject.org/mirror/sources/</a>. Every fi=
le
    downloaded was already present on the mirror.<br>
    <br>
    I downloaded qt-everywhere-opensource-src-4.8.0.tar.gz from a Fedora
    Project mirror and added it to
    <a href=3D"http://downloads.yoctoproject.org/mirror/sources/" target=3D=
"_blank">http://downloads.yoctoproject.org/mirror/sources/</a> so we&#39;d =
have it.</div></blockquote><div><br></div><div style>Thank you. 4.8.0 had d=
efault preferrence -1.</div>

</div><div><br></div>-- <br><div dir=3D"ltr"><div style=3D"text-align:cente=
r"></div><div style=3D"text-align:center"><div align=3D"left" style=3D"font=
-family:&#39;Times New Roman&#39;;font-size:medium"><b style=3D"color:rgb(5=
1,51,51);font-family:Arial;font-size:small;text-align:center">Andrei Gherza=
n</b><font face=3D"Arial" color=3D"#333333" size=3D"-1"><br>

</font><font face=3D"Arial" color=3D"#333333" size=3D"-1">m: +40.744.478.41=
4 | =A0f: +40.31.816.28.12</font><br></div></div></div>
</div></div>

--20cf307ca1e48f708c04d584823a--
