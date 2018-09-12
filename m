Return-Path: <rehsack@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5E583796A2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 11:53:19 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id k5-v6so1707234wre.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 04:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=89tqLZkg33o2NixdvtjkeEhGVgMtNpK9EF7zB0Vz3sw=;
	b=rI7AL37pFV8vBO3nFT1u06V3PrkucAqJluQl5f3XZl4nWmnQAQoMN5TYtd25EH2xBR
	MUvgt6wizhy7TAu+ZBE0ERSAzaWYz51E9XeQ3H1Yx6kt30UHua6vlLh0ZXOh/6w1ifU8
	jAbG5kddCq5bV9Gj980Pfhyu9iO7TOiQWQUJyo7IV3+tyR9OW5HenbzhZps9L8XSlvcI
	2iCjXzBvcBmV1gKkLaTPuskUbraOtNH9UcmeJDhN1sR4Vg4J3IbLGl1nN5EeQNL/3/dt
	N5Nh1xjyaONJNeRc9LM7e2/gHf4asXKKVVTjf2UwRMsrK+Bfsa30ayms6JKTFVSQn8OQ
	KMtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=89tqLZkg33o2NixdvtjkeEhGVgMtNpK9EF7zB0Vz3sw=;
	b=mpBahO74Ha4ue47nAZQEWQ9cIPJ9imGCoAeWv19Ps1iVp7jwbAcnG1dqsyzEKAJluI
	QSOeZLS3uz8aoS2PXF3bPu2g/O/lvwJdlZVmfiSfZiKkgCVRuD8bCr9bsHXcPZ6mlo/O
	zN2xzRH9nRnOQiEZIsyZwifTvPyrDWK9zMkZV2lgdXeJEvmAVizqiBIJ005kYbjOnJLU
	5GMZjo79CJM1tza8fywecqyLv0N7yxcNhznhfXhS5bU69fOtbTX2IuSdMYZGMwzZOkLM
	5r4+OLPCOKA1QzSro0EEVUsjUEu+wUYFL+g+LAzzmNgAOuZndS5m0bPY8BxEsUXe92ec
	8NlA==
X-Gm-Message-State: APzg51CHMJ7TnSDWnTzPvHagY/Fuj6IMdYYf54DvlsChZ7T0vWX3i1VJ
	rIRvBGYICq+Gf2QQ9Gbx7tRsRHJX
X-Google-Smtp-Source: ANB0VdaHbiPBtOM7jQu2hAt1xFCbq/bPP8b+Yy5gSmiMHxQ0l968FwAnoikctmOnGiPzYKjo/Aq52Q==
X-Received: by 2002:a5d:68c9:: with SMTP id
	p9-v6mr1264465wrw.108.1536753199834; 
	Wed, 12 Sep 2018 04:53:19 -0700 (PDT)
Received: from [10.42.8.207] (b2b-78-94-80-58.unitymedia.biz. [78.94.80.58])
	by smtp.gmail.com with ESMTPSA id
	q135-v6sm2004703wmd.4.2018.09.12.04.53.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Sep 2018 04:53:18 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
Message-Id: <8ABCF3BE-EFE8-4FE6-9886-65F6AE4E4EDC@netbsd.org>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Date: Wed, 12 Sep 2018 13:53:16 +0200
In-Reply-To: <17b3364c-32a6-91db-6583-6eb7e0131394@xilinx.com>
To: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
References: <20180907145533.31088-1-sno@netbsd.org>
	<10772E09-62BB-4CFC-A99A-F4816FAE87C1@netbsd.org>
	<CANx9H-BfgTfmNs+oGxC-Cm=Tp464=fpZnMb17vbTWsRg2LTZdg@mail.gmail.com>
	<CANNYZj8dyfuOnHxqE7V5n3sz=3XjqPS98E2n=t2uJbPkvczKyw@mail.gmail.com>
	<6FC71ED0-1800-46FD-9A0D-1664CE908975@netbsd.org>
	<CAJTo0LYHhteuX2y0cvW9DWOw1ey31EpWDB1Q8mHHCN2qaxUung@mail.gmail.com>
	<27c3c64d-574e-e4b8-f1db-343e4a660724@xilinx.com>
	<F9FC0A02-BAE6-45CB-A38D-7AE4E39E5587@netbsd.org>
	<badf35f0-449f-d632-c016-509dfb3f0f01@xilinx.com>
	<0EC3E010-56C9-4EB4-90B4-FD9A68F99AAC@netbsd.org>
	<17b3364c-32a6-91db-6583-6eb7e0131394@xilinx.com>
X-Mailer: Apple Mail (2.3445.9.1)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] python3{,-native}: update to 3.7.0
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
X-List-Received-Date: Wed, 12 Sep 2018 11:53:19 -0000
X-Groupsio-MsgNum: 116185
Content-Type: multipart/signed;
	boundary="Apple-Mail=_EAC7E66A-01C5-4767-AF63-D87BA6A368DB";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_EAC7E66A-01C5-4767-AF63-D87BA6A368DB
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_7B0E3774-595D-4962-84D1-046A14C24F47"

--Apple-Mail=_7B0E3774-595D-4962-84D1-046A14C24F47
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> Am 11.09.2018 um 20:56 schrieb Alejandro Enedino Hernandez Samaniego =
<alejandro.enedino.hernandez-samaniego@xilinx.com>:
>=20
> Hey Jens,
>=20
Hey Alejandro,

> On 09/10/2018 11:58 PM, Jens Rehsack wrote:
>>=20
>>=20
>>> Am 10.09.2018 um 23:33 schrieb Alejandro Enedino Hernandez Samaniego =
<alejandro.enedino.hernandez-samaniego@xilinx.com =
<mailto:alejandro.enedino.hernandez-samaniego@xilinx.com>>:
>>>=20
>>> Hey Jens,
>>>=20
>>>=20
>>> As I explained before, when you create a manifest for python =
(target), it uses the native build as base (it literally runs the native =
python that was just built), it is assumed its the same version as =
target and contains all the modules provided by upstream, otherwise the =
missing modules cannot be checked for dependencies, and the manifest =
becomes incoherent, so its not an option to have an incomplete python =
native build.
>>>=20
>> In that case, uuid for target never gets deployed, but it is. And I =
didn't see any packaging issues for `python3` nor for =
`nativesdk-python3`
>=20
>=20
> I don't see what that has to do with anything, fixing the native build =
should not affect what gets deployed on target, thats exactly why we =
have a manifest, so they user can decide what to install and what not to =
install.

The manifest isn't used for python3-native.
You try to argue whether there is an error to be fixed - and I don't =
agree.
Each fix requires effort - and that's why some errors will never become =
fixed. When the impact is reasonable or high enough, fixes are more =
likely.

So: before you try to force me into "that's all ugly und must be =
seriously beautified just because ..." I will not do anything.
When you give me a sane reason, I try to understand and make a decision.

> I know you didn't see any packaging issues, but that doesn't mean they =
don't exist, just from the log I showed you, I can tell you that the =
python3-crypt package is not created correctly, for example, if you do:
>=20
> IMAGE_INSTALL_append =3D " python3-crypt"
>=20
> Boot the image, run python3 and you try to import sha3, it will fail, =
because the sha3*.so library won't be on the filesystem.
>=20
>=20
> And thats because the sha3.*.so library was just introduced in this =
upgrade, and our manifest isn't aware it exists, hence it'll end up on =
python3-misc and you have just created an unnecessary dependency from =
python3-crypt to python3-misc (and worse, a dependency which were not =
even aware of, until we test it manually), which beats the whole purpose =
of the manifest.
>=20
> The do_package function is not gonna fail just because, so you won't =
see errors, but the files will be packaged incorrectly, causing runtime =
errors as a consequence, the create_manifest task tries to solve these =
runtime issues before they happen.

That's something completely different. I'm not a python guy and I don't =
get from the ChangeLog what I have to change in the manifest.
I can and will do such stuff when doing the perl update. For python, I =
ask for review because of things I don't know.

You can give me a reasonable list of such changes and I update the =
manifest accordingly when I rebase the patch after Ross PGO patches are =
committed.

> Cheers,
>=20
> Alejandro
>=20
>=20
>>> Yes you probably need a patch to look at the correct directories for =
the h files, as well as a dependency to make the h files available on =
recipe-sysroot-native.
>>>=20
>> Please check the submission.
>=20
> I did, its not checking inside recipe-sysroot-native.

I know. You could check the submission anyway and find the right patch =
and then argue differently.

Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_7B0E3774-595D-4962-84D1-046A14C24F47
Content-Transfer-Encoding: 7bit
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv="Content-Type" content="text/html; charset=us-ascii"></head><body style="word-wrap: break-word; -webkit-nbsp-mode: space; line-break: after-white-space;" class=""><br class=""><div><br class=""><blockquote type="cite" class=""><div class="">Am 11.09.2018 um 20:56 schrieb Alejandro Enedino Hernandez Samaniego &lt;<a href="mailto:alejandro.enedino.hernandez-samaniego@xilinx.com" class="">alejandro.enedino.hernandez-samaniego@xilinx.com</a>&gt;:</div><br class="Apple-interchange-newline"><div class="">
  
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252" class="">
  
  <div text="#000000" bgcolor="#FFFFFF" class=""><p class="">Hey Jens,</p></div></div></blockquote><div>Hey&nbsp;<span style="caret-color: rgb(34, 34, 34); color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: small; background-color: rgb(255, 255, 255);" class="">Alejandro,</span></div><br class=""><blockquote type="cite" class=""><div class=""><div text="#000000" bgcolor="#FFFFFF" class="">
    <div class="moz-cite-prefix">On 09/10/2018 11:58 PM, Jens Rehsack
      wrote:<br class="">
    </div>
    <blockquote type="cite" cite="mid:0EC3E010-56C9-4EB4-90B4-FD9A68F99AAC@netbsd.org" class="">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252" class="">
      <br class="">
      <div class=""><br class="">
        <blockquote type="cite" class="">
          <div class="">Am 10.09.2018 um 23:33 schrieb Alejandro Enedino
            Hernandez Samaniego &lt;<a href="mailto:alejandro.enedino.hernandez-samaniego@xilinx.com" class="" moz-do-not-send="true">alejandro.enedino.hernandez-samaniego@xilinx.com</a>&gt;:</div>
          <br class="Apple-interchange-newline">
          <div class="">
            <meta http-equiv="Content-Type" content="text/html;
              charset=windows-1252" class="">
            <div text="#000000" bgcolor="#FFFFFF" class=""><p class="">Hey Jens,</p><p class=""><br class="">
              </p><p class="">As I explained before, when you create a
                manifest for python (target), it uses the native build
                as base (it literally runs the native python that was
                just built), it is assumed its the same version as
                target and contains all the modules provided by
                upstream, otherwise the missing modules cannot be
                checked for dependencies, and the manifest becomes
                incoherent, so its not an option to have an incomplete
                python native build.</p>
            </div>
          </div>
        </blockquote>
        <div class="">In that case, uuid for target never gets deployed, but it
          is. And I didn't see any packaging issues for `python3` nor
          for `nativesdk-python3`</div>
      </div>
    </blockquote>
    <br class="">
    <br class="">
    I don't see what that has to do with anything, fixing the native
    build should not affect what gets deployed on target, thats exactly
    why we have a manifest, so they user can decide what to install and
    what not to install.<br class=""></div></div></blockquote><div><br class=""></div><div>The manifest isn't used for python3-native.</div><div>You try to argue whether there is an error to be fixed - and I don't agree.</div><div>Each fix requires effort - and that's why some errors will never become fixed. When the impact is reasonable or high enough, fixes are more likely.</div><div><br class=""></div><div>So: before you try to force me into "that's all ugly und must be seriously beautified just because ..." I will not do anything.</div><div>When you give me a sane reason, I try to understand and make a decision.</div><br class=""><blockquote type="cite" class=""><div class=""><div text="#000000" bgcolor="#FFFFFF" class="">
    I know you didn't see any packaging issues, but that doesn't mean
    they don't exist, just from the log I showed you, I can tell you
    that the python3-crypt package is not created correctly, for
    example, if you do:<br class="">
    <br class="">
    IMAGE_INSTALL_append = " python3-crypt"<br class="">
    <br class="">
    Boot the image, run python3 and you try to import sha3, it will
    fail, because the sha3*.so library won't be on the filesystem.<br class="">
    <br class="">
    <br class="">
    And thats because the sha3.*.so library was just introduced in this
    upgrade, and our manifest isn't aware it exists, hence it'll end up
    on python3-misc and you have just created an unnecessary dependency
    from python3-crypt to python3-misc (and worse, a dependency which
    were not even aware of, until we test it manually), which beats the
    whole purpose of the manifest.<br class="">
    <br class="">
    The do_package function is not gonna fail just because, so you won't
    see errors, but the files will be packaged incorrectly, causing
    runtime errors as a consequence, the create_manifest task tries to
    solve these runtime issues before they happen.<br class=""></div></div></blockquote><div><br class=""></div><div>That's something completely different. I'm not a python guy and I don't get from the ChangeLog what I have to change in the manifest.</div><div>I can and will do such stuff when doing the perl update. For python, I ask for review because of things I don't know.</div><div><br class=""></div><div>You can give me a reasonable list of such changes and I update the manifest accordingly when I rebase the patch after Ross PGO patches are committed.</div><br class=""><blockquote type="cite" class=""><div class=""><div text="#000000" bgcolor="#FFFFFF" class="">
    Cheers,<br class="">
    <br class="">
    Alejandro<br class="">
    <br class="">
    <br class="">
    <blockquote type="cite" cite="mid:0EC3E010-56C9-4EB4-90B4-FD9A68F99AAC@netbsd.org" class="">
      <div class="">
        <blockquote type="cite" class="">
          <div class="">
            <div text="#000000" bgcolor="#FFFFFF" class=""><p class="">Yes you probably need a patch to look at the
                correct directories for the h files, as well as a
                dependency to make the h files available on
                recipe-sysroot-native.</p>
            </div>
          </div>
        </blockquote>
        Please check the submission.</div>
    </blockquote>
    <br class="">
    I did, its not checking inside recipe-sysroot-native.<br class=""></div></div></blockquote><div><br class=""></div><div>I know. You could check the submission anyway and find the right patch and then argue differently.</div></div><div class=""><br class=""></div>Cheers<br class=""><div class="">
<div style="color: rgb(0, 0, 0); letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" class=""><div style="color: rgb(0, 0, 0); letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" class=""><div class="">--&nbsp;</div><div class="">Jens Rehsack - <a href="mailto:rehsack@gmail.com" class="">rehsack@gmail.com</a></div></div></div>
</div>
<br class=""></body></html>

--Apple-Mail=_7B0E3774-595D-4962-84D1-046A14C24F47--

--Apple-Mail=_EAC7E66A-01C5-4767-AF63-D87BA6A368DB
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAluY/iwACgkQRJmWrtzl
Cp2XrBAAknL8lfPzVe1M3N2obJloAS2/cQg7XcKzu/TiUfzNVUkOco178PgaV6+4
FLv04DqxBWTX5i9nQBwydf9lcCsz8d2afeQwqLUUH1wI2qINcbeWMaMosVA/Eea0
JPmnKIES/qOk4LMg+sKjOFdSEiwHz2NrLI+Q9mdxWcfeISz5tPW9iG1oI0hTiEqH
adiR2rzVOtiQjoBUiWjISXZey59MbSGCtUTHwmicHziNwn173S3LY843XB6MRtMI
AEGxf6cx4vUm3IGMNDTLQcxUprUc7rvTjzqDfPspaMUPqSIB68cdTuDVat8gVJIK
tXzYHej4vkKtJRibVY7g2Ct4/CxuXPzOUNcc3EJiqTKriIYbMXx6sI5I1Pc8gowI
wv8PbCL6W0AHw0K0/Rc+OG4VWHaXdDb7y34fzUJrjWRrjQIPgI0Hg74HKk4JvSB9
1RTS+dJVFFfK1+LMkPcmXO9xLovAOKhWomz2k1ngVtdbDF4cozXNCUfdEaZc0TK+
BybJgEf73RAHRwJFWcBQ3xZlBDrECjGS1O/Hv/ffTmM3JXHUc0NKx87/ZlNkGJUF
yzIzfQj3S4mUXiXFWAXcSgCt01hqN/H9gufjhSjXOa/xpoBpsOCLMEWe8l2Vhquc
T09qwyxxMXV9NOUIBl3T2YmMKsxqRfvhuct1TvQE2BPVjFYbiEY=
=dJsb
-----END PGP SIGNATURE-----

--Apple-Mail=_EAC7E66A-01C5-4767-AF63-D87BA6A368DB--
