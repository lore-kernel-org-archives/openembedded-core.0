Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id C7C5460722
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jul 2017 11:11:10 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id r30so162676417qtc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Jul 2017 04:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FUHbApWRTJUIqNuNQqbTzY46TWNTLKkftzCZZMAIiW4=;
	b=CuZudT77v4caq3cTUk43RaBOutIM1s8/lTkYI+LCWMAAy1sMn7dhw4FBzGjKhNpr9X
	RKWZDLtpGnXtEU90Pn5D1fQZ9giFoSKpPR1lfNqTGNNUEJSlem8V42mGT6fEGWj3OMRI
	+pVvFhicQ3nGbLnbgFGun7LHk3zuYtXV2upqm3dxvp9VVsumFdzBWn35UJ2M6D72PyB8
	QAigB8lKu0G1zYdHsXou6LOtTEW0//bXf9BLoQx+ckidmEAtiN7g6LQBeoZPpYMd8JSD
	7fvn3tohX7u01Pqi+BexQ8lf7AkEgD9i6/U4Gt23fI3S7n6Uz+jmPHJqn62sTny7W1q7
	++UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FUHbApWRTJUIqNuNQqbTzY46TWNTLKkftzCZZMAIiW4=;
	b=DAvlobYTRix/ddNaFME+3nOKPJsP8pQGkEFc0crXEn8fisld1PkFNP+I7w4Yx0P95a
	+RWCa4uEhe0C6iEGyAUqZlYZBOXq3EKU0iISlalSuPY1B6H6R/vyUymWoy2Dg+KHBO+W
	jsQtPAUcfEJifLbHvrioXeAusbRHSFzrNbGzC388NjyYc4GPImurjzE58v8zjJMOkI0T
	jDR8VTymylPvsKIqkF428A3OtYCv+e8aw0y6rWlxD/QWEb4cIILuSsht3MVeBaR1Jw6v
	jMddYbpc3+fd6A+jjBbps/EGpM6Z0It2ic0TWuH0RqNAwhkaSJgqbzMnWOi/gbub5edF
	3zOA==
X-Gm-Message-State: AKS2vOylwVqPCupu0Lctyul6/Z6NLZufr0NxMgdGuZd1lA4mZq1Tinx3
	v/TvAMXzWEQS/+a2AMtkQZTmXOUnwyul
X-Received: by 10.237.42.129 with SMTP id t1mr45100816qtd.93.1499166671739;
	Tue, 04 Jul 2017 04:11:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.31.118 with HTTP; Tue, 4 Jul 2017 04:10:51 -0700 (PDT)
In-Reply-To: <f85be1a4-8f83-fc87-c808-00190070bd3e@pelagicore.com>
References: <20170703123433.23528-2-gordan.markus@pelagicore.com>
	<CAJTo0LYCWai_UhPcfv7VV3iB+NCRdCvPjsLdbE=iv3f9CSzA0Q@mail.gmail.com>
	<f85be1a4-8f83-fc87-c808-00190070bd3e@pelagicore.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 4 Jul 2017 12:10:51 +0100
Message-ID: <CAJTo0LZ+dRctp=f6ZZMb_JTT3dt5jed5g+NP4yq=ssry74KjwA@mail.gmail.com>
To: =?UTF-8?Q?Gordan_Marku=C5=A1?= <gordan.markus@pelagicore.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cairo: fix QA Issue
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
X-List-Received-Date: Tue, 04 Jul 2017 11:11:18 -0000
Content-Type: multipart/alternative; boundary="94eb2c05ac1aedb4ae05537bf0eb"

--94eb2c05ac1aedb4ae05537bf0eb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, the bbappend is breaking the packaging so should fix its own mess.

Ross

On 4 July 2017 at 08:36, Gordan Marku=C5=A1 <gordan.markus@pelagicore.com> =
wrote:

> On 2017-07-03 15:56, Burton, Ross wrote:
>
>
> On 3 July 2017 at 13:34, Gordan Marku=C5=A1 <gordan.markus@pelagicore.com=
>
>  wrote:
>
>> -FILES_${PN}-dev +=3D "${libdir}/cairo/*.so"
>> +FILES_${PN}-dev +=3D "${libdir}/cairo ${libdir}/cairo/*.so"
>>
>
> I just spent five minutes working out *why* this fixes the QA issue you
> were getting.
>
> A better fix would be to delete ${libdir}/cairo using:
>
>   rmdir ${libdir}/cairo || :
>
> or
>
>   rmdir --ignore-fail-on-non-empty ${libdir}/cairo
>
> (former is POSIX compliant, but I can't think of a situation where that i=
s
> only a hypothetical problem)
>
> Then in the commit message you can say that the directory is always
> created but it only has content if you disable cairo-trace.  At least, I
> hope you are explicitly disabling cairo-trace as there's no other way I c=
an
> see for you go get this.
>
> Ross
>
> Thanks for the suggestion Ross, and you are right this only happens if
> there is a bbappend that removes the 'cairo-perf-utils' package. An examp=
le
> of this is the meta-ivi layer.
> Experimenting a bit it seems to me that even by adding the directory
> removal, in case it is empty, the do_package step still fails. By
> inspecting further I can observe that the directory is in fact not being
> removed but left empty which is quite puzzling.
> After doing some thinking I believe it might be better to add the removal
> of the directory and the package files in the bbappend, do you agree with
> this? Here is the PR to meta-ivi that does that https://github.com/GENIVI=
/
> meta-ivi/pull/45.
>

--94eb2c05ac1aedb4ae05537bf0eb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes, the bbappend is breaking the packaging so should fix =
its own mess.<div><br></div><div>Ross</div></div><div class=3D"gmail_extra"=
><br><div class=3D"gmail_quote">On 4 July 2017 at 08:36, Gordan Marku=C5=A1=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:gordan.markus@pelagicore.com" targ=
et=3D"_blank">gordan.markus@pelagicore.com</a>&gt;</span> wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">
 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF"><div><div class=3D"h5">
    On 2017-07-03 15:56, Burton, Ross wrote:<br>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr"><br>
        <div>
          <div class=3D"gmail_extra">
            <div class=3D"gmail_quote">On 3 July 2017 at 13:34, Gordan
              Marku=C5=A1=C2=A0<span dir=3D"ltr">&lt;<a href=3D"mailto:gord=
an.markus@pelagicore.com" target=3D"_blank">gordan.markus@<wbr>pelagicore.c=
om</a>&gt;</span>=C2=A0wrote:<br>
              <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(=
204,204,204);padding-left:1ex">
                <div id=3D"m_-718120503281343026gmail-:yn" class=3D"m_-7181=
20503281343026gmail-a3s m_-718120503281343026gmail-aXjCH m_-718120503281343=
026gmail-m15d087d2c6436eea">-FILES_${PN}-dev +=3D
                  &quot;${libdir}/cairo/*.so&quot;<br>
                  +FILES_${PN}-dev +=3D &quot;${libdir}/cairo
                  ${libdir}/cairo/*.so&quot;<br>
                </div>
              </blockquote>
            </div>
            <br>
          </div>
          <div class=3D"gmail_extra">I just spent five minutes working out
            *why* this fixes the QA issue you were getting.</div>
        </div>
        <div class=3D"gmail_extra"><br>
        </div>
        <div class=3D"gmail_extra">A better fix would be to delete
          ${libdir}/cairo using:</div>
        <div class=3D"gmail_extra"><br>
        </div>
        <div class=3D"gmail_extra">=C2=A0 rmdir ${libdir}/cairo || :</div>
        <div class=3D"gmail_extra"><br>
        </div>
        <div class=3D"gmail_extra">or</div>
        <div class=3D"gmail_extra"><br>
        </div>
        <div class=3D"gmail_extra">=C2=A0 rmdir=C2=A0--ignore-fail-on-non-<=
wbr>empty
          ${libdir}/cairo</div>
        <div class=3D"gmail_extra"><br>
        </div>
        <div class=3D"gmail_extra">(former is POSIX compliant, but I can&#3=
9;t
          think of a situation where that is only a hypothetical
          problem)</div>
        <div class=3D"gmail_extra"><br>
        </div>
        <div class=3D"gmail_extra">Then in the commit message you can say
          that the directory is always created but it only has content
          if you disable cairo-trace.=C2=A0 At least, I hope you are
          explicitly disabling cairo-trace as there&#39;s no other way I ca=
n
          see for you go get this.</div>
        <div class=3D"gmail_extra"><br>
        </div>
        <div class=3D"gmail_extra">Ross</div>
      </div>
    </blockquote></div></div>
    Thanks for the suggestion Ross, and you are right this only happens
    if there is a bbappend that removes the &#39;cairo-perf-utils&#39; pack=
age.
    An example of this is the meta-ivi layer.<br>
    Experimenting a bit it seems to me that even by adding the directory
    removal, in case it is empty, the do_package step still fails. By
    inspecting further I can observe that the directory is in fact not
    being removed but left empty which is quite puzzling.<br>
    After doing some thinking I believe it might be better to add the
    removal of the directory and the package files in the bbappend, do
    you agree with this? Here is the PR to meta-ivi that does that
    <a class=3D"m_-718120503281343026moz-txt-link-freetext" href=3D"https:/=
/github.com/GENIVI/meta-ivi/pull/45" target=3D"_blank">https://github.com/G=
ENIVI/<wbr>meta-ivi/pull/45</a>.<br>
  </div>

</blockquote></div><br></div>

--94eb2c05ac1aedb4ae05537bf0eb--
