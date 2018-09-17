Return-Path: <rehsack@gmail.com>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id E4CBA796B7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 19:00:31 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id s12-v6so10848503wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 12:00:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=7QKhPyC8p+3xHVyBWfSyW2BMFFIL/CPF1f5RNFKUym0=;
	b=Wkt4iu9iPkIOQnxOOC3qmjovqP7jv8zLXnzQnita3pL6DtE3jIXs+bVHpfAB9Cc7yw
	RGYnuDRf7ueNjw2WncUAopaFCcfM5qmHy2bYu5PlfCYHO3N/Q235+u8TcMh2QPQRcaub
	9FgcFj+IyOleoQJ7fY9QiV1KkaSeKxly9GwuK7hgIn+MpBo3xYId7dBIk78IjNv1C8o7
	R/1RrGDhrqRcW1EIjx1UxYQM5c0IGrWKmzhCOYebNObMqavwF78QxA8EB5uwPLzvgp8A
	ZHbnvUbwEZUokOMhNxKPllrbDAHsMBWNrGsJPVagkmyJbZfEMUxy2PNd/QjHNVvmS/VY
	y1vg==
X-Gm-Message-State: APzg51BYWGZC6/nWN0SjQPjaCQdEbyF+3TCOkIeA3B9k3I5xurOTFGQk
	L4S+svMD1U2ho6/92FkApbW/RXvqEc/opYoaEV0=
X-Google-Smtp-Source: ANB0VdYkMQuFq3Gqq5FGqbmfqVG/pqBbV4DIPBKNxQo+vRWvUj3oT+1EEpwB9GFWiHwR/2c4qV2jlN3djS3Vlqou+ZQ=
X-Received: by 2002:a1c:e141:: with SMTP id
	y62-v6mr12243849wmg.138.1537210832341; 
	Mon, 17 Sep 2018 12:00:32 -0700 (PDT)
MIME-Version: 1.0
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
	<8ABCF3BE-EFE8-4FE6-9886-65F6AE4E4EDC@netbsd.org>
	<b74ecac2-3eb1-62e9-6162-449d678e03c9@xilinx.com>
In-Reply-To: <b74ecac2-3eb1-62e9-6162-449d678e03c9@xilinx.com>
From: Jens Rehsack <sno@netbsd.org>
Date: Mon, 17 Sep 2018 21:00:19 +0200
Message-ID: <CAANR1XEDXbrnn=yGRC_XKOdjqtbWqucJdukodZJWC8SV7BPVKQ@mail.gmail.com>
To: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 17 Sep 2018 19:00:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alejandro,

Am Mi., 12. Sep. 2018 um 23:03 Uhr schrieb Alejandro Hernandez
<alejandro.enedino.hernandez-samaniego@xilinx.com>:
>
> Hello Jens,
>
>
> On 9/12/2018 4:53 AM, Jens Rehsack wrote:
>
>
>
> Am 11.09.2018 um 20:56 schrieb Alejandro Enedino Hernandez Samaniego <ale=
jandro.enedino.hernandez-samaniego@xilinx.com>:
>
> Hey Jens,
>
> Hey Alejandro,
>
> On 09/10/2018 11:58 PM, Jens Rehsack wrote:
>
>
>
> Am 10.09.2018 um 23:33 schrieb Alejandro Enedino Hernandez Samaniego <ale=
jandro.enedino.hernandez-samaniego@xilinx.com>:
>
> Hey Jens,
>
>
> As I explained before, when you create a manifest for python (target), it=
 uses the native build as base (it literally runs the native python that wa=
s just built), it is assumed its the same version as target and contains al=
l the modules provided by upstream, otherwise the missing modules cannot be=
 checked for dependencies, and the manifest becomes incoherent, so its not =
an option to have an incomplete python native build.
>
> In that case, uuid for target never gets deployed, but it is. And I didn'=
t see any packaging issues for `python3` nor for `nativesdk-python3`
>
>
>
> I don't see what that has to do with anything, fixing the native build sh=
ould not affect what gets deployed on target, thats exactly why we have a m=
anifest, so they user can decide what to install and what not to install.
>
>
> The manifest isn't used for python3-native.
> You try to argue whether there is an error to be fixed - and I don't agre=
e.
> Each fix requires effort - and that's why some errors will never become f=
ixed. When the impact is reasonable or high enough, fixes are more likely.
>
> So: before you try to force me into "that's all ugly und must be seriousl=
y beautified just because ..." I will not do anything.
> When you give me a sane reason, I try to understand and make a decision.
>
>
>
> Ok first of all, I am not forcing you to do anything, and I've never said=
 its all ugly, so please don't reply aggressively since I am just trying to=
 help you get your patch merged, and it needs to work correctly for that to=
 happen, this is a community and if you don't want to do something just don=
't do it, we're all trying to make this work in the best possible way, whet=
her we get paid for it or do it for fun.

Sounded a bit different, thanks for clarification.

> Second of all, I know the manifest is not used for python3-native, I neve=
r said python3-native used the manifest, but I am trying to explain to you =
why the fix is necessary, and I am even telling you what the fix is, so you=
 don't have to waste your time and effort on that, here it goes once again:
>
>
> There are python3-native and python3 packages.
>
> The python3 package uses a manifest file, to go through the installed fil=
es by the whole python installation from upstream, and separates it in seve=
ral packages, providing more granularity and giving users the possibility o=
f installing a trimmed version of python, only with what they require on th=
eir image.
>
> I think we're good until here.
>
> The problem here comes because we don't control upstream python and it ch=
anges with every release, so new files show up, for example what I mentione=
d before sha3.*.so.
>
> Since that file is not on the manifest, during packaging, it will end up =
on python3-misc, which contains basically everything that doesn't belong an=
ywhere else, although clearly this file in specific should belong in python=
3-crypt.
>
> What this means for the user, is that he/she will install python3-crypt a=
nd expect it to work at runtime, but this wont happen, and when sha3 gets i=
mported (or something that depends on it to run), it will fail,  this will =
cause a bug on our system, which we would need to fix (yes, fixing bugs tak=
es effort and time).
>
> At this point an usual fix would be to just install python3-misc as well,=
 because it contains the required library, but python3-misc also contains o=
ther unnecessary stuff that the user doesn't need, but anyways an RDEPENDS =
to python3-misc would somewhat solve it. The correct fix however, is to add=
 the sha3.*.so file to the manifest, on the python3-crypt package, that way=
, it will get installed and the user would be able to use it correctly. Thi=
s would solve one problem, but its still not enough, because, I can see (fr=
om the log), that there are some dependencies from other packages to sha3, =
which means that yes, it will work correctly if we decide to install python=
3-crypt, but if we just install one of the other packages that need it, it =
won't,  again, it will fail to import it and its the same story, its introd=
ucing a bug into the system.

Everything clear until here.

> OK, up to this point I've explained how this will cause bugs in our syste=
m, now, what does this fix that I mentioned has to do with everything?.
>
> There is a special task for the python3 package (not native), that create=
s a manifest for us, this task tries to import every module from the manife=
st and get its dependencies, for example, if the python3-numbers package ne=
eded the sha3 library (this is just an example I really don't know if numbe=
rs needs this), this will be picked up, and the python3-numbers package wil=
l RDEPEND on python3-crypt, hence solving both the bugs I mentioned before,=
 even before they exist.

I get lost at this point and probably getting that resolved - which
task is it, how is the python3-manifest.json involved or better: how
can this become automatically updated?

> Now why is a fix to python3-native important for python3 target?
>
> Because of the way the previously mentioned script works, it calls python=
3-native (it has to, because it can't use python from host for example, bec=
ause its not guaranteed its the same version of python3 target, and we need=
 it to contain exactly the same files) to import all modules in an automate=
d manner and get their dependencies, that's how we know if there are new fi=
les and/or rdependencies between python3 packages.
>
> So what will happen if the python3-native build isn't complete?, whatever=
 file its missing, we wont be able to catch dependencies to it, causing the=
m to end up in python3-misc, causing the issue #1, and also, in any case, t=
here wont be an RDEPENDS created to python3-misc (which would solve issue #=
1), sometimes files do belong in python3-misc, but we need to know that so =
we can add an RDEPENDS to it, but again if we just add an RDEPENDS to pytho=
n3-misc we'll be causing issue/bug #2, which we won't catch, until someone =
actually tries to run something on a running image and gets an import failu=
re on their application.
>
>
> I'm not even asking you to fix the manifest, I am simply asking you to pr=
ovide a functional native package (in this case, functional means with all =
modules built), so it doesn't break the current functionality that helps us=
 catch these bugs. I hope its clear now that I am not asking you to just ch=
ange something because I want "beautiful" code everywhere and I never was, =
I am asking you to do it because your patch will introduce bugs into the sy=
stem, and I am trying to help you fix them.

That's all an implication of one big unknown - that
python3-manifest.json has to be upgraded by invoking a special task.
Once I understand what's to be done, I'll add an appropriate note for
future updaters.

> Alejandro
>
>
>
> I know you didn't see any packaging issues, but that doesn't mean they do=
n't exist, just from the log I showed you, I can tell you that the python3-=
crypt package is not created correctly, for example, if you do:
>
> IMAGE_INSTALL_append =3D " python3-crypt"
>
> Boot the image, run python3 and you try to import sha3, it will fail, bec=
ause the sha3*.so library won't be on the filesystem.
>
>
> And thats because the sha3.*.so library was just introduced in this upgra=
de, and our manifest isn't aware it exists, hence it'll end up on python3-m=
isc and you have just created an unnecessary dependency from python3-crypt =
to python3-misc (and worse, a dependency which were not even aware of, unti=
l we test it manually), which beats the whole purpose of the manifest.
>
> The do_package function is not gonna fail just because, so you won't see =
errors, but the files will be packaged incorrectly, causing runtime errors =
as a consequence, the create_manifest task tries to solve these runtime iss=
ues before they happen.
>
>
> That's something completely different. I'm not a python guy and I don't g=
et from the ChangeLog what I have to change in the manifest.
> I can and will do such stuff when doing the perl update. For python, I as=
k for review because of things I don't know.
>
> You can give me a reasonable list of such changes and I update the manife=
st accordingly when I rebase the patch after Ross PGO patches are committed=
.
>
> Cheers,
>
> Alejandro
>
>
> Yes you probably need a patch to look at the correct directories for the =
h files, as well as a dependency to make the h files available on recipe-sy=
sroot-native.
>
> Please check the submission.
>
>
> I did, its not checking inside recipe-sysroot-native.
>
>
> I know. You could check the submission anyway and find the right patch an=
d then argue differently.
>
> Cheers
> --
> Jens Rehsack - rehsack@gmail.com
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

