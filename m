Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 13C7971957
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 20:17:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8IKH9OA001095
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 18 Sep 2018 13:17:09 -0700 (PDT)
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 18 Sep 2018 13:17:08 -0700
To: Alexander Kanavin <alex.kanavin@gmail.com>, Andre McCurdy
	<armccurdy@gmail.com>
References: <1536656353-30689-1-git-send-email-hongxu.jia@windriver.com>
	<CANNYZj8SRYoj3QXZ7_bCLe6qrJq1TBq-WOsHMOLVLpveh151bA@mail.gmail.com>
	<41457254-4083-3d7c-4e93-95b320fe7dbb@windriver.com>
	<CANNYZj9EZF5u2R55LBnBooyPpAhi7O69kVtWsvZesXZ3H7qxOQ@mail.gmail.com>
	<0a2370ce-a756-5cf8-256b-929b70367e3a@windriver.com>
	<CANNYZj90HLS4HZwtZK+9azCa1iMOjTXtWGy1RCBqCwRGPk+mfA@mail.gmail.com>
	<CAJ86T=U96L46iLVd3mA7nsK8v=G9XcOj9tJivTGVcmVO1WaXZA@mail.gmail.com>
	<CANNYZj_++nm8Ag+5FhkjeFOcLx+qVgGSfmf0cNpCcurad3AsgQ@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <104ba9fc-0ce1-f5c6-a845-20bb5c02c3f2@windriver.com>
Date: Tue, 18 Sep 2018 16:17:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CANNYZj_++nm8Ag+5FhkjeFOcLx+qVgGSfmf0cNpCcurad3AsgQ@mail.gmail.com>
X-Originating-IP: [172.25.44.4]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssh: build support openssl 1.1
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
X-List-Received-Date: Tue, 18 Sep 2018 20:17:09 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 09/13/2018 08:27 AM, Alexander Kanavin wrote:
...
> 
> Good news everyone! Upstream openssh has finally gave into user
> pressure, and added 1.1 support in the master branch. So the issue is
> moot; we just need to wait for them to tag a release (no backports
> please).
> https://github.com/openssh/openssh-portable/commits/master
> 
> This will make oe-core entirely free of openssl10 dependencies.

Excellent.

Is there a planned release of openssh in the next day or
does someone need to switch to git or backport some/all of
the 36 post 7.8p1 commits for M3?

../Randy


$ git log --oneline V_7_8_P1...
cce8cbe0 Fix openssl-1.1 fallout for --without-openssl.
149519b9 add futex(2) syscall to seccomp sandbox
4488ae1a really add source for authopt_fuzz this time
9201784b remove accidentally checked-in authopt_fuzz binary
beb9e522 upstream:
            second try, deals properly with missing and private-only
6bc5a24a fuzzer harness for authorized_keys option parsing
6c8b82fc upstream: revert following; deals badly with agent keys
6da046f9 upstream: garbage-collect moribund ssh_new_private() API.
1f24ac5f upstream: Use consistent format in debug log for keys readied,
488c9325 upstream: Fix warnings caused by
             user_from_uid() and group_from_gid()
0aa1f230 allow SIGUSR1 as synonym for SIGINFO
d64e7852 add compat header
a3fd8074 upstream: missed a bit of openssl-1.0.x API in this unittest
86e0a9f3 upstream: use only openssl-1.1.x API here too
48f54b9d adapt -portable to OpenSSL 1.1x API
86112951 forgot to stage these test files in commit d70d061
482d23bc upstream: hold our collective noses and
             use the openssl-1.1.x API in
d70d0618 upstream: Include certs with multiple RSA signature variants in
f803b268 upstream: test revocation by explicit hash and by fingerprint
2de78bc7 upstream: s/sshkey_demote/sshkey_from_private/g
41c115a5 delete the correct thing; kexfuzz binary
f0fcd7e6 upstream: fix edit mistake; spotted by jmc@
4cc259ba upstream: add SSH_ALLOWED_CA_SIGALGS - the default list of
ba9e7883 upstream: add sshkey_check_cert_sigtype() that checks a
a70fd4ad upstream: add cert->signature_type field and
             keep it in sync with
357128ac upstream: Add "ssh -Q sig" to allow listing supported signature
9405c621 upstream: allow key revocation by SHA256 hash and
             allow ssh-keygen
50e2687e upstream: log certificate fingerprint in authentication
de37ca90 upstream: Add FALLTHROUGH comments where appropriate.
                       Patch from
247766cd upstream: ssh -MM requires confirmation for all operations that
db8bb80e upstream: fix misplaced parenthesis inside if-clause.
                       it's harmless
086cc614 upstream: fix build with DEBUG_PK enabled
26788330 Handle ngroups>_SC_NGROUPS_MAX.
039bf2a8 Initial len for the fmt=NULL case.
ea9c06e1 Include stdlib.h.
9617816d document some more regress control env variables

../Randy

> 
> Alex
> 


-- 
# Randy MacLeod
# Wind River Linux

