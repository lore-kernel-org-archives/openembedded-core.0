Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yw0-f178.google.com (mail-yw0-f178.google.com
	[209.85.161.178])
	by mail.openembedded.org (Postfix) with ESMTP id DEB1C70031
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Feb 2017 16:50:14 +0000 (UTC)
Received: by mail-yw0-f178.google.com with SMTP id l19so70174256ywc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2017 08:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=k0k7QeVNLT9lGlq0CJ6TBaJubNxdvOH7ldUyFWXdXXM=;
	b=T+PcQ+k+fLasDXG0kk5eHXjVsxU6hojte31k+vpHDgCoaqvEtAk11Pq94GUxtuUvn0
	PG8OvQmYD/qR+H4K3mJXirw2f6tAsN20+ngDnmjuohTSZS3UiW4qDqWlZZfp22sH0hhH
	MfTgpwX1hpe/gs47fle19aZinqmnkcEh6oi4g0p47xiSXJ9nPuz9Hw3jFAnOgPnJktRr
	iEnKck0o1f/7nErYScDNpSHOW2SaypoY8YMNJJLkQKOSZuiNISLkZC361yAmQAZjyvPc
	KVrf0lAFSQsEFwR4HJdQJRZtLYW7YNVYrNTYNO3/u476Nwj20bW+OZ4CWvNOOT+YsUZc
	anZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=k0k7QeVNLT9lGlq0CJ6TBaJubNxdvOH7ldUyFWXdXXM=;
	b=MxWvnH7MhIMldqPHOph32eAuMT7Z7mC3h1LGjuCFviTL/m8CZuKFx0X8O8ewxfjrSE
	00rnXmRPyxddJK2I0vgxWbFNRQN9f18ORv4xttzBXOVV7m8HAm8pIqgJ9S73nXwtTVwE
	Bsb57S1vUxKzE5MJYbEMn530ZflGvnbsyoKwa7NkEeI1XuJvYFgb12JxGEDQWI8Dt6Hr
	wS1IM7vxR0Cs6pXro3iBpbMcb7MJKj1zODt2OBnyvpQwflUAVV0JZw/fheE5eUL/dmcW
	rASfUPpBRaBM4HJL+6JSv3zTkSjNnW6z5NeFAV7TlwY1jlQKM81E7Lhij4htWor0fAie
	gnIA==
X-Gm-Message-State: AMke39nzthEA33Pqp+QHzN3MWYcMheGYT1QJeOpBOpCmKpFS3UwjIRXrxYCeUYQOB+R2EEB0On/EASpGg2RH7bIu
X-Received: by 10.129.177.197 with SMTP id p188mr11253734ywh.183.1486486214856;
	Tue, 07 Feb 2017 08:50:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.13.234.11 with HTTP; Tue, 7 Feb 2017 08:49:44 -0800 (PST)
In-Reply-To: <8ab28120-012b-4f16-e812-a06ad8b351b9@linux.intel.com>
References: <3230301C09DEF9499B442BBE162C5E48AC31CBF7@SESTOEX04.enea.se>
	<CAJTo0LZ+khtB9f==4KQr_iaVJhHmTGfFj-2toAnN=GFPiyUVDQ@mail.gmail.com>
	<CAHiDW_GXHZ4Yk_pbEZXLgvzsnohZFjHGcDdfMUFz2bmCcSbJ=g@mail.gmail.com>
	<8ab28120-012b-4f16-e812-a06ad8b351b9@linux.intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Tue, 7 Feb 2017 18:49:44 +0200
Message-ID: <CAHiDW_FOiz=0AjAqBZ0fByYQcr7eU5SSK-F91QejFss8+V3OKA@mail.gmail.com>
To: Mariano Lopez <mariano.lopez@linux.intel.com>
Cc: "mariano.lopez@intel.com" <mariano.lopez@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: do_populate_cve_db: Error in executing cve-check-update
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
X-List-Received-Date: Tue, 07 Feb 2017 16:50:15 -0000
Content-Type: multipart/alternative; boundary=94eb2c146204cd24b70547f38a13

--94eb2c146204cd24b70547f38a13
Content-Type: text/plain; charset=UTF-8

On 7 February 2017 at 17:07, Mariano Lopez <mariano.lopez@linux.intel.com>
wrote:

> On 06/02/17 09:17, Jussi Kukkonen wrote:
>
>
>
> On 6 February 2017 at 16:56, Burton, Ross <ross.burton@intel.com> wrote:
>
>>
>> On 6 February 2017 at 14:43, Sona Sarmadi <sona.sarmadi@enea.com> wrote:
>>
>>>     bbdebug 2 "Updating cve-check-tool database located in $cve_dir"
>>>     if cve-check-update -d "$cve_dir" ; then
>>>         printf "CVE database was updated on %s UTC\n\n" "$(LANG=C date
>>> --utc +'%F %T')" > "$cve_file"
>>>     else
>>>         bbwarn "Error in executing cve-check-update"
>>> <<<<<<<<<<<<<<<<<<<<<<<<<
>>>
>>
>> This definitely needs to be rewritten so you can see the output if it
>> fails.  Just run cve-check-update -d <dir> yourself and see what it says.
>> Last time I had this failing it was because the mitre servers were offline.
>>
>
> Agreed about the error output.
>
>
> Also you need to patch the tool, most of the time there is no output from
> it; I think Ikey would integrate those patches without hesitation.
>

I don't know... the branch we're using is called 'legacy-tool' and is quite
different from master (which isn't usable).


> I think recipe specific sysroots broke the setup somehow (so the tools are
> not actually in sysroot when they're needed). I'm taking a look at this
> tomorrow.
>
>
> I tried today, but I'm having a hard time with the proxies (like always)
> so I can't really verify this. Were you able to check?
>

Yes, the problem is indeed that cve-check-update is not found when
do_populate_cve_db() is run. In addition to that curl-native is currently
broken by recipe-specific sysroots as well (CA certificates are looked for
in the wrong place) and this makes all downloads in cve-check-tool fail.

TL;DR: working on it.

Jussi

--94eb2c146204cd24b70547f38a13
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><div class=3D"gmail_quote">=
On 7 February 2017 at 17:07, Mariano Lopez <span dir=3D"ltr">&lt;<a href=3D=
"mailto:mariano.lopez@linux.intel.com" target=3D"_blank">mariano.lopez@linu=
x.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF"><span class=3D"gmail-">
    <p>On 06/02/17 09:17, Jussi Kukkonen
      wrote:<br></p>
    <blockquote type=3D"cite">
      <div dir=3D"ltr"><br>
        <div class=3D"gmail_extra"><br>
          <div class=3D"gmail_quote">On 6 February 2017 at 16:56, Burton,
            Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.=
com" target=3D"_blank">ross.burton@intel.com</a>&gt;</span>
            wrote:<br>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              <div dir=3D"ltr">
                <div class=3D"gmail_extra"><span><br>
                    <div class=3D"gmail_quote">On 6 February 2017 at
                      14:43, Sona Sarmadi <span dir=3D"ltr">&lt;<a href=3D"=
mailto:sona.sarmadi@enea.com" target=3D"_blank">sona.sarmadi@enea.com</a>&g=
t;</span>
                      wrote:<br>
                      <blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                        <div id=3D"gmail-m_3873397909308596662m_58810534074=
45794043:1vq" class=3D"gmail-m_3873397909308596662m_5881053407445794043a3s =
gmail-m_3873397909308596662m_5881053407445794043aXjCH gmail-m_3873397909308=
596662m_5881053407445794043m15a13e1fae6963e3">=C2=A0 =C2=A0
                          bbdebug 2 &quot;Updating cve-check-tool database
                          located in $cve_dir&quot;<br>
                          =C2=A0 =C2=A0 if cve-check-update -d &quot;$cve_d=
ir&quot; ; then<br>
                          =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf &quot;CVE data=
base was updated on %s
                          UTC\n\n&quot; &quot;$(LANG=3DC date --utc +&#39;%=
F %T&#39;)&quot; &gt;
                          &quot;$cve_file&quot;<br>
                          =C2=A0 =C2=A0 else<br>
                          =C2=A0 =C2=A0 =C2=A0 =C2=A0 bbwarn &quot;Error in=
 executing
                          cve-check-update&quot;=C2=A0
&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt=
;&lt;&lt;&lt;&lt;&lt;&lt;</div>
                      </blockquote>
                    </div>
                    <br>
                  </span>This definitely needs to be rewritten so you
                  can see the output if it fails.=C2=A0 Just run
                  cve-check-update -d &lt;dir&gt; yourself and see what
                  it says.=C2=A0 Last time I had this failing it was becaus=
e
                  the mitre servers were offline.</div>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div>Agreed about the error output.</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br></span>
    Also you need to patch the tool, most of the time there is no output
    from it; I think Ikey would integrate those patches without
    hesitation.<span class=3D"gmail-">=C2=A0<br></span></div></blockquote><=
div><br></div><div>I don&#39;t know... the branch we&#39;re using is called=
 &#39;legacy-tool&#39; and is quite different from master (which isn&#39;t =
usable).</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><div bgcolor=3D"#FFFFFF"><span class=3D"gmail-">
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_extra">
          <div class=3D"gmail_quote">
            <div><br>
            </div>
            <div>I think recipe specific sysroots broke the setup
              somehow (so the tools are not actually in sysroot when
              they&#39;re needed). I&#39;m taking a look at this tomorrow.<=
/div>
          </div>
        </div>
      </div>
    </blockquote>
    <br></span>
    I tried today, but I&#39;m having a hard time with the proxies (like
    always) so I can&#39;t really verify this. Were you able to check?</div=
></blockquote><div><br></div><div>Yes, the problem is indeed that cve-check=
-update is not found when do_populate_cve_db() is run. In addition to that =
curl-native is currently broken by recipe-specific sysroots as well (CA cer=
tificates are looked for in the wrong place) and this makes all downloads i=
n cve-check-tool fail.</div><div><br></div><div>TL;DR: working on it.</div>=
<div><br></div><div>Jussi</div><div><br></div></div></div></div>

--94eb2c146204cd24b70547f38a13--
