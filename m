Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f171.google.com (mail-qc0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 18BCD65D19
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jan 2015 15:49:01 +0000 (UTC)
Received: by mail-qc0-f171.google.com with SMTP id s11so12519814qcv.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jan 2015 07:49:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=CsI4NpzGN1Ee7znowIkDlJ/JCXg4B6H+Jdry/iuCikE=;
	b=BVoTmntIAQqRezKQK98ogWjhmQ5pAbsM4E5/Xf0poLAJ2dVJTHs7OpijjahWsEqNiz
	2ZE1fI5ZeLManqPbxhkdLsJGRWG6hXqJZPBxL8crwyPRUuBZJvsfYvugpPXBP/bOD7PK
	r4cC3Unc1X08TZz2rwK92w+JSgFkO4hh7eas/TF6apa+gOKm5O9VO3eIwLRwsRE4rGjY
	VWX5hgIl+vl7fJ6GszyvxmdifQObjDjWE2GMArLpmXw5qyxPRWhv4xdZ/uGhaZ6r+wUl
	1qCyo0PZuIVWqV46o7s+rnxU7W8veQP8hTa/nrOEXIACZoDru7A4oQVvL10WgRDmBuzr
	7WgA==
X-Gm-Message-State: ALoCoQkBIZJsDoZArraeoT3OzOVIJ3s7Ml7PZgmyE9mgiNhSIG1/wTU5O5wfw/XM/ebiAx7Zgru8
X-Received: by 10.229.192.5 with SMTP id do5mr59094240qcb.12.1421768941883;
	Tue, 20 Jan 2015 07:49:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Tue, 20 Jan 2015 07:48:41 -0800 (PST)
In-Reply-To: <54BE21A5.1090705@digi.com>
References: <1417451798-28112-1-git-send-email-ross.burton@intel.com>
	<54BE21A5.1090705@digi.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 20 Jan 2015 15:48:41 +0000
Message-ID: <CAJTo0LYH7rThX75FBB+mk=M1BL=Qnnh1Ng4npx4+9AtceVAzGw@mail.gmail.com>
To: Javier Viguera <javier.viguera@digi.com>,
	Armin Kuster <akuster808@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [Dizzy backport] python: ensure all of Python is installed in nativesdk
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
X-List-Received-Date: Tue, 20 Jan 2015 15:49:11 -0000
Content-Type: multipart/alternative; boundary=001a11337bfcbc0d75050d176081

--001a11337bfcbc0d75050d176081
Content-Type: text/plain; charset=UTF-8

CC'ing Armin to ensure that he see's this.

Ross

On 20 January 2015 at 09:36, Javier Viguera <javier.viguera@digi.com> wrote:

> Hi all,
>
> Toolchains/SDK generated with Dizzy have the problem this commit fixes.
>
> So could this be cherry-picked to Dizzy?
>
> It applies just fine, there is no need to rework it.
>
> -
> Regards,
>
> Javier Viguera
>
>
> On 01/12/14 17:36, Ross Burton wrote:
>
>> If any part of Python gets installed in a SDK, we need to ensure that all
>> of
>> Python gets installed to avoid replacing python in the environment with a
>> minimal package set.
>>
>> Signed-off-by: Ross Burton <ross.burton-ral2JQCrhuEAvxtiuMwx3w@public.
>> gmane.org>
>> ---
>>   meta/recipes-devtools/python/python_2.7.3.bb |    1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-devtools/python/python_2.7.3.bb
>> b/meta/recipes-devtools/python/python_2.7.3.bb
>> index 50c751e..7f13e22 100644
>> --- a/meta/recipes-devtools/python/python_2.7.3.bb
>> +++ b/meta/recipes-devtools/python/python_2.7.3.bb
>> @@ -161,6 +161,7 @@ require python-${PYTHON_MAJMIN}-manifest.inc
>>   # manual dependency additions
>>   RPROVIDES_${PN}-core = "${PN}"
>>   RRECOMMENDS_${PN}-core = "${PN}-readline"
>> +RRECOMMENDS_${PN}-core_append_class-nativesdk = "
>> nativesdk-python-modules"
>>   RRECOMMENDS_${PN}-crypt = "openssl"
>>   RRECOMMENDS_${PN}-crypt_class-nativesdk = "nativesdk-openssl"
>>
>>
>>  --
> _______________________________________________
>
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11337bfcbc0d75050d176081
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">CC&#39;ing Armin to ensure that he see&#39;s this.<div><br=
></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gm=
ail_quote">On 20 January 2015 at 09:36, Javier Viguera <span dir=3D"ltr">&l=
t;<a href=3D"mailto:javier.viguera@digi.com" target=3D"_blank">javier.vigue=
ra@digi.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi all,=
<br>
<br>
Toolchains/SDK generated with Dizzy have the problem this commit fixes.<br>
<br>
So could this be cherry-picked to Dizzy?<br>
<br>
It applies just fine, there is no need to rework it.<br>
<br>
-<br>
Regards,<br>
<br>
Javier Viguera<span class=3D""><br>
<br>
<br>
On 01/12/14 17:36, Ross Burton wrote:<br>
</span><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><span class=3D"">
If any part of Python gets installed in a SDK, we need to ensure that all o=
f<br>
Python gets installed to avoid replacing python in the environment with a<b=
r>
minimal package set.<br>
<br></span>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton-ral2JQCrhuEAvx=
tiuMwx3w@public.gmane.org" target=3D"_blank">ross.burton-<u></u>ral2JQCrhuE=
AvxtiuMwx3w@public.<u></u>gmane.org</a>&gt;<span class=3D""><br>
---<br>
=C2=A0 meta/recipes-devtools/python/<a href=3D"http://python_2.7.3.bb" targ=
et=3D"_blank">p<u></u>ython_2.7.3.bb</a> |=C2=A0 =C2=A0 1 +<br>
=C2=A0 1 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-devtools/<u></u>python/<a href=3D"http://python_2=
.7.3.bb" target=3D"_blank">python_2.7.3.bb</a> b/meta/recipes-devtools/<u><=
/u>python/<a href=3D"http://python_2.7.3.bb" target=3D"_blank">python_2.7.3=
.bb</a><br>
index 50c751e..7f13e22 100644<br>
--- a/meta/recipes-devtools/<u></u>python/<a href=3D"http://python_2.7.3.bb=
" target=3D"_blank">python_2.7.3.bb</a><br>
+++ b/meta/recipes-devtools/<u></u>python/<a href=3D"http://python_2.7.3.bb=
" target=3D"_blank">python_2.7.3.bb</a><br>
@@ -161,6 +161,7 @@ require python-${PYTHON_MAJMIN}-<u></u>manifest.inc<br>
=C2=A0 # manual dependency additions<br>
=C2=A0 RPROVIDES_${PN}-core =3D &quot;${PN}&quot;<br>
=C2=A0 RRECOMMENDS_${PN}-core =3D &quot;${PN}-readline&quot;<br>
+RRECOMMENDS_${PN}-core_<u></u>append_class-nativesdk =3D &quot; nativesdk-=
python-modules&quot;<br>
=C2=A0 RRECOMMENDS_${PN}-crypt =3D &quot;openssl&quot;<br>
=C2=A0 RRECOMMENDS_${PN}-crypt_class-<u></u>nativesdk =3D &quot;nativesdk-o=
penssl&quot;<br>
<br>
<br>
</span></blockquote>
-- <br>
______________________________<u></u>_________________<div class=3D"HOEnZb"=
><div class=3D"h5"><br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.<u></u>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/<u></u>mailman/listinfo/o=
penembedded-<u></u>core</a><br>
</div></div></blockquote></div><br></div>

--001a11337bfcbc0d75050d176081--
