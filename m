Return-Path: <rehsack@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id ED9BD60720
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2018 06:58:46 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id j26-v6so24407827wre.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 23:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=dz/LV/I/Lx+n63oy3ToGW6YjiKd8Tcf2V6jSBXPBmYk=;
	b=fwQ7oXlm7O5g3+qFd3iadtgX4Q02rGqXMWGO0i9yfYNSS0mtlDG2YNiUpYx7GQwPOQ
	X13wJ7keIjQ0RyZ3uDIPA3Khe9fuMV1tla7eV0UtM0Z73PS9RI3qyGN1EiHagOPc/XS/
	+Owt8uOIEEgmvIslXK85AbLs0CRNo5SXc3pZa7n89O3f1Nt7QsSvrhRWX2BWMrtxn74C
	PUQHXlfjQVwGy9y0UwEf3nWz8ZReFQHWyLxrAtepudL7NtIgnpXyNNKCCU21zVO/2GOq
	1gQQFmVfNvTJjGsXbJvANJ7zrgjlwEmwbI1jUAwK+oeWPURXwIEZP3bxtuIst45peUyk
	DL0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=dz/LV/I/Lx+n63oy3ToGW6YjiKd8Tcf2V6jSBXPBmYk=;
	b=TPHStfwHJ5JG5KOWpSZLm/ExLx4AIazjcCsrhdM+v+rrLIjImJ7tBwTOezvPBYf5g0
	abpLbGkokMrICB/mPiMCY8oMpA4wAalLYtDj2KfDTIsifs+tngyK59LiPGizjPt/iZ6T
	V+fdXd8NP/bcZiVLVPntFMd/8/frYV2GiCglxjhYy0XkBxoxqIYFyzAzeXBfmr2jd77z
	mTfn7HEgnEl19c8pFqiDx17rNhUML6DcoPflnHG0zyEIKx8oEnA2ZgXGG7FUr8TnocDr
	2hdUAWZ/pgQY7EtXHIadP5PkE1eWNJURF1fS0O5xfrhE2YSuTzooUBqFgHNWR6XXkyKr
	0wvA==
X-Gm-Message-State: APzg51CnMG8CL5PF/2K4GpTO8CZAPeJRUhToY1EMQIBB1FVoJ6gO9pJ3
	kmJHR9Rhd5gPLoB3q+cRbQsyNvCl
X-Google-Smtp-Source: ANB0VdZaJCBql9E+yWj1tM8sG0AWJRZs2/ny6Sea+nMbHCa6dPNq+49/T9ascdnZD4yBVF2bhsUIsQ==
X-Received: by 2002:adf:a3d9:: with SMTP id
	m25-v6mr17813611wrb.1.1536649127412; 
	Mon, 10 Sep 2018 23:58:47 -0700 (PDT)
Received: from [10.42.8.207] (b2b-78-94-80-58.unitymedia.biz. [78.94.80.58])
	by smtp.gmail.com with ESMTPSA id
	j191-v6sm98771wmb.37.2018.09.10.23.58.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Sep 2018 23:58:46 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
Message-Id: <0EC3E010-56C9-4EB4-90B4-FD9A68F99AAC@netbsd.org>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Date: Tue, 11 Sep 2018 08:58:44 +0200
In-Reply-To: <badf35f0-449f-d632-c016-509dfb3f0f01@xilinx.com>
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
X-List-Received-Date: Tue, 11 Sep 2018 06:58:47 -0000
X-Groupsio-MsgNum: 116126
Content-Type: multipart/signed;
	boundary="Apple-Mail=_71C71875-DC14-4A33-9731-7BCA01BE045F";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_71C71875-DC14-4A33-9731-7BCA01BE045F
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_86C0C83D-AC78-4773-B406-30D483150457"

--Apple-Mail=_86C0C83D-AC78-4773-B406-30D483150457
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> Am 10.09.2018 um 23:33 schrieb Alejandro Enedino Hernandez Samaniego =
<alejandro.enedino.hernandez-samaniego@xilinx.com>:
>=20
> Hey Jens,
>=20
>=20
> As I explained before, when you create a manifest for python (target), =
it uses the native build as base (it literally runs the native python =
that was just built), it is assumed its the same version as target and =
contains all the modules provided by upstream, otherwise the missing =
modules cannot be checked for dependencies, and the manifest becomes =
incoherent, so its not an option to have an incomplete python native =
build.
>=20
In that case, uuid for target never gets deployed, but it is. And I =
didn't see any packaging issues for `python3` nor for =
`nativesdk-python3`
> Yes you probably need a patch to look at the correct directories for =
the h files, as well as a dependency to make the h files available on =
recipe-sysroot-native.
>=20
Please check the submission.

Jens
> Alejandro
>=20
> On 09/10/2018 02:05 PM, Jens Rehsack wrote:
>> Hey Alejandro,
>>=20
>> I fixed that for cross-compile only, since I would need add a patch =
and a dependency python3-native for one thing: calculate uuids.
>> When you can explain to me why the python-native needs that, I'll =
change that from -target & nativesdk to all.
>>=20
>> =46rom my point of view it's not a question of having every =
(unneeded) python module being built for the native python, which is =
used for cross-compiling python and some modules only.
>>=20
>> Cheers,
>> Jens
>>=20
>>> Am 10.09.2018 um 22:17 schrieb Alejandro Enedino Hernandez Samaniego =
<alejandro.enedino.hernandez-samaniego@xilinx.com =
<mailto:alejandro.enedino.hernandez-samaniego@xilinx.com>>:
>>>=20
>>> Hey Jens,
>>>=20
>>> The compilation log for python3-native still shows that it didn't =
build the uuid module
>>>=20
>>>=20
>>> Python build finished successfully!
>>> The necessary bits to build these optional modules were not found:
>>> _uuid
>>>=20
>>> Please look at my previous reply to find how this can be solved (its =
likely a missing DEPENDS).
>>>=20
>>>=20
>>> Also, this patch is missing the new python3 manifest for this =
release, there appears to be a few new modules that we need to decide =
which package they belong to, this is the output of bitbake python3 -c =
create_manifest:
>>>=20
>>>=20
>>> | ERROR:
>>> | The following files are repeated (contained in more than one =
package),
>>> | this is likely to happen when new files are introduced after an =
upgrade,
>>> | please check which package should get it,
>>> |  modify the manifest accordingly and re-run the create_manifest =
task:
>>> | ${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_blake2.*.so
>>> | ${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha3.*.so
>>> | ${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_contextvars.*.so
>>> | ${libdir}/python${PYTHON_MAJMIN}/contextvars.py
>>> | ${libdir}/python${PYTHON_MAJMIN}/__pycache__/contextvars.*.pyc
>>> | ${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_queue.*.so
>>>=20
>>>=20
>>> Cheers,
>>>=20
>>>=20
>>> Alejandro
>>>=20
>>>=20
>>> On 09/10/2018 09:38 AM, Burton, Ross wrote:
>>>> One thing to be aware of is that I've been fixing up Python's PGO
>>>> support and there's a slew of patches in master-next and more just
>>>> posted that this needs to be rebased on top of.  Good news is that =
my
>>>> patches remove two of the patches we've been carrying!
>>>>=20
>>>> Ross
>>>>=20
>>>> On 10 September 2018 at 17:36, Jens Rehsack <sno@netbsd.org =
<mailto:sno@netbsd.org>> wrote:
>>>>>=20
>>>>> Am 10.09.2018 um 11:35 schrieb Alexander Kanavin =
<alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>>:
>>>>>=20
>>>>> Large parts of dnf and friends have been rewritten in c++. I have =
not
>>>>> yet updated and reviewed that, that will happen in the next cycle.
>>>>>=20
>>>>>=20
>>>>> If I can prepare something for you - drop me a note.
>>>>> Otherwise - the perl-5.28 update ("." in @INC, regex buffer =
overflow, ...)
>>>>> is also
>>>>> awaiting some progress (I can keep "myself" busy).
>>>>>=20
>>>>> There's already enough disruption to deal with (postinsts errors,
>>>>> openssl 1.1, both caused by me :)
>>>>>=20
>>>>>=20
>>>>> You know, corner, ash, ... things happen. But there is progress! =
Great!
>>>>>=20
>>>>> Good that we got all the way to do_rootfs though with 3.7.
>>>>>=20
>>>>>=20
>>>>> Yeah, but than came postinst (coreutils :P) :D
>>>>>=20
>>>>> Cheers
>>>>>=20
>>>>> Alex
>>>>>=20
>>>>> 2018-09-10 0:38 GMT+02:00 Tim Orling <ticotimo@gmail.com =
<mailto:ticotimo@gmail.com>>:
>>>>>=20
>>>>> I did not review the patches closely, but I did try to build
>>>>> core-image-full-cmdline with the tip of poky and these patches =
applied.
>>>>> Everything was fine until do_rootfs... I've attached the log.
>>>>>=20
>>>>> Essentially, there are some bits of dnf and so on which are not =
ready for
>>>>> Python 3.7. We have dnf version 2.7.5, but the latest upstream =
release is
>>>>> 3.4.0 (with a 3.5.0 just 3 days ago). Not sure yet if that would =
have
>>>>> helped.
>>>>>=20
>>>>> --
>>>>> _______________________________________________
>>>>> Openembedded-core mailing list
>>>>> Openembedded-core@lists.openembedded.org =
<mailto:Openembedded-core@lists.openembedded.org>
>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core =
<http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>>>>>=20
>>>>>=20
>>>>> --
>>>>> Jens Rehsack - rehsack@gmail.com <mailto:rehsack@gmail.com>
>>>>>=20
>>>>>=20
>>>>> --
>>>>> _______________________________________________
>>>>> Openembedded-core mailing list
>>>>> Openembedded-core@lists.openembedded.org =
<mailto:Openembedded-core@lists.openembedded.org>
>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core =
<http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>>>>>=20
>>>=20
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org =
<mailto:Openembedded-core@lists.openembedded.org>
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core =
<http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>>=20
>> --
>> Jens Rehsack - rehsack@gmail.com <mailto:rehsack@gmail.com>
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_86C0C83D-AC78-4773-B406-30D483150457
Content-Transfer-Encoding: 7bit
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv="Content-Type" content="text/html; charset=us-ascii"></head><body style="word-wrap: break-word; -webkit-nbsp-mode: space; line-break: after-white-space;" class=""><br class=""><div><br class=""><blockquote type="cite" class=""><div class="">Am 10.09.2018 um 23:33 schrieb Alejandro Enedino Hernandez Samaniego &lt;<a href="mailto:alejandro.enedino.hernandez-samaniego@xilinx.com" class="">alejandro.enedino.hernandez-samaniego@xilinx.com</a>&gt;:</div><br class="Apple-interchange-newline"><div class="">
  
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252" class="">
  
  <div text="#000000" bgcolor="#FFFFFF" class=""><p class="">Hey Jens,</p><p class=""><br class="">
    </p><p class="">As I explained before, when you create a manifest for python
      (target), it uses the native build as base (it literally runs the
      native python that was just built), it is assumed its the same
      version as target and contains all the modules provided by
      upstream, otherwise the missing modules cannot be checked for
      dependencies, and the manifest becomes incoherent, so its not an
      option to have an incomplete python native build.</p></div></div></blockquote><div>In that case, uuid for target never gets deployed, but it is. And I didn't see any packaging issues for `python3` nor for `nativesdk-python3`</div><blockquote type="cite" class=""><div class=""><div text="#000000" bgcolor="#FFFFFF" class=""><p class="">Yes you probably need a patch to look at the correct directories
      for the h files, as well as a dependency to make the h files
      available on recipe-sysroot-native.</p></div></div></blockquote>Please check the submission.</div><div><br class=""></div><div>Jens<br class=""><blockquote type="cite" class=""><div class=""><div text="#000000" bgcolor="#FFFFFF" class=""><p class="">Alejandro<br class="">
    </p>
    <br class="">
    <div class="moz-cite-prefix">On 09/10/2018 02:05 PM, Jens Rehsack
      wrote:<br class="">
    </div>
    <blockquote type="cite" cite="mid:F9FC0A02-BAE6-45CB-A38D-7AE4E39E5587@netbsd.org" class="">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252" class="">
      Hey Alejandro,
      <div class=""><br class="">
      </div>
      <div class="">I fixed that for cross-compile only, since I would
        need add a patch and a dependency python3-native for one thing:
        calculate uuids.</div>
      <div class="">When you can explain to me why the python-native
        needs that, I'll change that from -target &amp; nativesdk to
        all.</div>
      <div class=""><br class="">
      </div>
      <div class="">From my point of view it's not a question of having
        every (unneeded) python module being built for the native
        python, which is used for cross-compiling python and some
        modules only.</div>
      <div class=""><br class="">
      </div>
      <div class="">Cheers,</div>
      <div class="">Jens<br class="">
        <div class=""><br class="">
          <blockquote type="cite" class="">
            <div class="">Am 10.09.2018 um 22:17 schrieb Alejandro
              Enedino Hernandez Samaniego &lt;<a href="mailto:alejandro.enedino.hernandez-samaniego@xilinx.com" class="" moz-do-not-send="true">alejandro.enedino.hernandez-samaniego@xilinx.com</a>&gt;:</div>
            <br class="Apple-interchange-newline">
            <div class="">
              <div class="">Hey Jens,<br class="">
                <br class="">
                The compilation log for python3-native still shows that
                it didn't build the uuid module<br class="">
                <br class="">
                <br class="">
                Python build finished successfully!<br class="">
                The necessary bits to build these optional modules were
                not found:<br class="">
                _uuid<br class="">
                <br class="">
                Please look at my previous reply to find how this can be
                solved (its likely a missing DEPENDS).<br class="">
                <br class="">
                <br class="">
                Also, this patch is missing the new python3 manifest for
                this release, there appears to be a few new modules that
                we need to decide which package they belong to, this is
                the output of bitbake python3 -c create_manifest:<br class="">
                <br class="">
                <br class="">
                | ERROR:<br class="">
                | The following files are repeated (contained in more
                than one package),<br class="">
                | this is likely to happen when new files are introduced
                after an upgrade,<br class="">
                | please check which package should get it,<br class="">
                | &nbsp;modify the manifest accordingly and re-run the
                create_manifest task:<br class="">
                |
                ${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_blake2.*.so<br class="">
                |
                ${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha3.*.so<br class="">
                |
                ${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_contextvars.*.so<br class="">
                | ${libdir}/python${PYTHON_MAJMIN}/contextvars.py<br class="">
                |
                ${libdir}/python${PYTHON_MAJMIN}/__pycache__/contextvars.*.pyc<br class="">
                |
                ${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_queue.*.so<br class="">
                <br class="">
                <br class="">
                Cheers,<br class="">
                <br class="">
                <br class="">
                Alejandro<br class="">
                <br class="">
                <br class="">
                On 09/10/2018 09:38 AM, Burton, Ross wrote:<br class="">
                <blockquote type="cite" class="">One thing to be aware
                  of is that I've been fixing up Python's PGO<br class="">
                  support and there's a slew of patches in master-next
                  and more just<br class="">
                  posted that this needs to be rebased on top of. &nbsp;Good
                  news is that my<br class="">
                  patches remove two of the patches we've been carrying!<br class="">
                  <br class="">
                  Ross<br class="">
                  <br class="">
                  On 10 September 2018 at 17:36, Jens Rehsack &lt;<a href="mailto:sno@netbsd.org" class="" moz-do-not-send="true">sno@netbsd.org</a>&gt; wrote:<br class="">
                  <blockquote type="cite" class=""><br class="">
                    Am 10.09.2018 um 11:35 schrieb Alexander Kanavin
                    &lt;<a href="mailto:alex.kanavin@gmail.com" class="" moz-do-not-send="true">alex.kanavin@gmail.com</a>&gt;:<br class="">
                    <br class="">
                    Large parts of dnf and friends have been rewritten
                    in c++. I have not<br class="">
                    yet updated and reviewed that, that will happen in
                    the next cycle.<br class="">
                    <br class="">
                    <br class="">
                    If I can prepare something for you - drop me a note.<br class="">
                    Otherwise - the perl-5.28 update ("." in @INC, regex
                    buffer overflow, ...)<br class="">
                    is also<br class="">
                    awaiting some progress (I can keep "myself" busy).<br class="">
                    <br class="">
                    There's already enough disruption to deal with
                    (postinsts errors,<br class="">
                    openssl 1.1, both caused by me :)<br class="">
                    <br class="">
                    <br class="">
                    You know, corner, ash, ... things happen. But there
                    is progress! Great!<br class="">
                    <br class="">
                    Good that we got all the way to do_rootfs though
                    with 3.7.<br class="">
                    <br class="">
                    <br class="">
                    Yeah, but than came postinst (coreutils :P) :D<br class="">
                    <br class="">
                    Cheers<br class="">
                    <br class="">
                    Alex<br class="">
                    <br class="">
                    2018-09-10 0:38 GMT+02:00 Tim Orling &lt;<a href="mailto:ticotimo@gmail.com" class="" moz-do-not-send="true">ticotimo@gmail.com</a>&gt;:<br class="">
                    <br class="">
                    I did not review the patches closely, but I did try
                    to build<br class="">
                    core-image-full-cmdline with the tip of poky and
                    these patches applied.<br class="">
                    Everything was fine until do_rootfs... I've attached
                    the log.<br class="">
                    <br class="">
                    Essentially, there are some bits of dnf and so on
                    which are not ready for<br class="">
                    Python 3.7. We have dnf version 2.7.5, but the
                    latest upstream release is<br class="">
                    3.4.0 (with a 3.5.0 just 3 days ago). Not sure yet
                    if that would have<br class="">
                    helped.<br class="">
                    <br class="">
                    --<br class="">
                    _______________________________________________<br class="">
                    Openembedded-core mailing list<br class="">
                    <a href="mailto:Openembedded-core@lists.openembedded.org" class="" moz-do-not-send="true">Openembedded-core@lists.openembedded.org</a><br class="">
<a class="moz-txt-link-freetext" href="http://lists.openembedded.org/mailman/listinfo/openembedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br class="">
                    <br class="">
                    <br class="">
                    --<br class="">
                    Jens Rehsack - <a class="moz-txt-link-abbreviated" href="mailto:rehsack@gmail.com">rehsack@gmail.com</a><br class="">
                    <br class="">
                    <br class="">
                    --<br class="">
                    _______________________________________________<br class="">
                    Openembedded-core mailing list<br class="">
                    <a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a><br class="">
<a class="moz-txt-link-freetext" href="http://lists.openembedded.org/mailman/listinfo/openembedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br class="">
                    <br class="">
                  </blockquote>
                </blockquote>
                <br class="">
                -- <br class="">
                _______________________________________________<br class="">
                Openembedded-core mailing list<br class="">
                <a href="mailto:Openembedded-core@lists.openembedded.org" class="" moz-do-not-send="true">Openembedded-core@lists.openembedded.org</a><br class="">
<a class="moz-txt-link-freetext" href="http://lists.openembedded.org/mailman/listinfo/openembedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br class="">
              </div>
            </div>
          </blockquote>
        </div>
        <br class="">
        <div class="">
          <div style="letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; word-wrap: break-word; -webkit-nbsp-mode: space; line-break: after-white-space;" class="">
            <div style="letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; word-wrap: break-word; -webkit-nbsp-mode: space; line-break: after-white-space;" class="">
              <div class="">--&nbsp;</div>
              <div class="">Jens Rehsack - <a href="mailto:rehsack@gmail.com" class="" moz-do-not-send="true">rehsack@gmail.com</a></div>
            </div>
          </div>
        </div>
        <br class="">
      </div>
    </blockquote>
    <br class="">
  </div>

-- <br class="">_______________________________________________<br class="">Openembedded-core mailing list<br class=""><a href="mailto:Openembedded-core@lists.openembedded.org" class="">Openembedded-core@lists.openembedded.org</a><br class="">http://lists.openembedded.org/mailman/listinfo/openembedded-core<br class=""></div></blockquote></div><br class=""><div class="">
<div style="color: rgb(0, 0, 0); letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" class=""><div style="color: rgb(0, 0, 0); letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" class=""><div class="">--&nbsp;</div><div class="">Jens Rehsack - <a href="mailto:rehsack@gmail.com" class="">rehsack@gmail.com</a></div></div></div>
</div>
<br class=""></body></html>

--Apple-Mail=_86C0C83D-AC78-4773-B406-30D483150457--

--Apple-Mail=_71C71875-DC14-4A33-9731-7BCA01BE045F
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAluXZ6QACgkQRJmWrtzl
Cp2QLg/+PEp2DQ8gJIxfd5TemCWKPDJIch9kw+Z3ddiRENJwvWcAkvP4IY5lIm70
bAFI1CpN4JvzBjJ3ilGH42qBpU06jLHbve3ZMEKwlq/Eo2xxNKt11rBYq6/MA/Pn
zRz0/4QnYD9KuzpOS3AtsrO/oNOLlRuEQfTGem02FMbX1jFA/70TywTxNYq3ovqy
eacF8B09pmt/MoIHb5fmULTy/sq2gPfE/G1gsfNUzGZFLxA0f/jnDyHpKMMDf29P
mgOvFmFNKp3w6jf5HlspylzW2WH+TzhLii5xqSnEVjvPce2mMxnI5uIWE1pPcZsA
plYTjlx7nA5VVOWFWUEmqCvIInQ1WcEkavv9seUAsS4oGi4E7o22MnQUNKiWI9wV
an+nAU8KG8uNtGqDVTsu4QHCyBA+OG6VMGMuQldkbkVCF6ZRsySN/KeH94tbwKsv
M/gAcXjo22v56NHhqMmTSNvxLDq18Hlj99rIq8BOWjRybBDlZosbduA6JHfqg8E5
J2LjPpOTz4gA/VeTD4QNKYmgXCv+aS6cV1GANYV2VV6QJWep4amerHPyotkQh5qF
6ujwn2w/Pk2xJ/ZJxrBJqMDCr5I5Fhf4nO2qdikfhHKxiq9NnUpWdjLHMISts4NU
XfrBfoZDovCD1EIfLchsoCZbL++xZrRLFMv8B9kds3bbhY5daYw=
=CPz2
-----END PGP SIGNATURE-----

--Apple-Mail=_71C71875-DC14-4A33-9731-7BCA01BE045F--
