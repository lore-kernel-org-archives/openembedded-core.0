Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RdVNc-0006xp-W6
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 00:15:25 +0100
Received: from [192.168.2.10] (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id E34A4A64E2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 00:08:17 +0100 (CET)
Message-ID: <4EF266E0.8040302@eukrea.com>
Date: Thu, 22 Dec 2011 00:08:16 +0100
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1324044340-21898-1-git-send-email-eric@eukrea.com>
	<4EF19E06.6030004@eukrea.com>
	<C6510F6D410BB64A8C15398EDC6B847C2401D155@ORSMSX102.amr.corp.intel.com>
In-Reply-To: <C6510F6D410BB64A8C15398EDC6B847C2401D155@ORSMSX102.amr.corp.intel.com>
Subject: Re: [PATCH] gdb-cross-canadian: build gdb with python	support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Dec 2011 23:15:25 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Jessica,

Le 21/12/2011 23:12, Zhang, Jessica a =C3=A9crit :
> Can you submit the patch against qt layer or meta-oe instead of oe-core=
, since python enabled gdb shouldn't be turned on by default in oe-core b=
ased on its usage, qtcreator, etc.
>
I can submit that to meta-oe (as qt is inside oe-core) but having a gdb w=
ith=20
python can
also make sense in oe-core as this is not dedicated to qtcreator but give=
s=20
very good scripting capabilities to debug with gdb :
http://sourceware.org/gdb/current/onlinedocs/gdb/Python.html#Python

Eric


