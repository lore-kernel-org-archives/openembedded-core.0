Received: from mail-vc0-f181.google.com ([209.85.220.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1USNMh-00007M-7L
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 10:05:15 +0200
Received: by mail-vc0-f181.google.com with SMTP id ia10so1104802vcb.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2013 00:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=vCrBac7NgmI/LLlVcsOw8MrG6uBJF68OebZUv0+T/sU=;
	b=fMOGnTeg3IUuG9k3Emn4VzMKsgEpq/nqmLLC3NtV6EswBFzcXMyWp1bnDUOw+gkTjj
	TYg5mANhnGDtOtH1WK3JM7RyyQ3xi16MKMNKGiTkqI+LXe3M7FG+5448aPSAYVnWnbUZ
	Hg1PiUeBw/1G3WoIAq9nV2/7oAsIpSyNCGAFx/hKa0+ElmlSjk61xncx9I+PfenWd4mt
	4aR5rLAxro9cRfLW0wub8job2c/26y4dJMiY0HkckvvkeYn9c6S0exHsotZ5n1E2q1ME
	SGjYEREjad0EFZg2J9Gj3MQByBa0mq3WV2Pv+/RAngiJXogVhVwtsAFvhCV0FO+R/aQ5
	YO4w==
MIME-Version: 1.0
X-Received: by 10.220.140.18 with SMTP id g18mr4040568vcu.54.1366184863563;
	Wed, 17 Apr 2013 00:47:43 -0700 (PDT)
Received: by 10.52.185.168 with HTTP; Wed, 17 Apr 2013 00:47:43 -0700 (PDT)
In-Reply-To: <CALbNGRQ+BqGarZWxmtj50S4rJbDtNPGqB=eWvotBVdVAcviedQ@mail.gmail.com>
References: <cover.1364456659.git.raj.khem@gmail.com>
	<ddbbb594a0a4c3ff64bb5e4ce0be895a5e2f0193.1364456659.git.raj.khem@gmail.com>
	<20130328122110.GA5105@jama>
	<35803143-FAED-48CC-9FD1-1E216B3A575C@gmail.com>
	<A54391FA-3CD5-4290-A92B-EE3477A2EEAE@dominion.thruhere.net>
	<D8B28775-1426-427F-B7CB-E10164FAF197@gmail.com>
	<CALbNGRSs_t4EbStjw4S6djPiL3xJDRQ0U0MvS820f1OkC7Q6cQ@mail.gmail.com>
	<1364824441.24754.20.camel@localhost>
	<CALbNGRSqEdebP4WsrH9xrW30k+MuxfaXousVfNfjdufS4yCfSw@mail.gmail.com>
	<CAJTo0LZGADsne_bKyDDTX2Vt4QX=pfv+Vr27Xi93B8C_S3WJkg@mail.gmail.com>
	<CALbNGRRCFyiD+6eY1xMe6o8dqtpuyf6YAEa7xKZ=f8wBv262uA@mail.gmail.com>
	<CAJTo0Ladru_hAgyL32SX8bDet3euSFz9Jf=jiJxBJqiNv8eseQ@mail.gmail.com>
	<CALbNGRQ+BqGarZWxmtj50S4rJbDtNPGqB=eWvotBVdVAcviedQ@mail.gmail.com>
Date: Wed, 17 Apr 2013 09:47:43 +0200
Message-ID: <CALbNGRTMUkavk8669XUPf+YMEBTibUPhpnHh35xYG4eENO-ktw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] systemd: Upgrade to 199
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
X-List-Received-Date: Wed, 17 Apr 2013 08:05:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2013 at 1:01 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Fri, Apr 12, 2013 at 12:53 PM, Burton, Ross <ross.burton@intel.com> wr=
ote:
>> Hi Andreas,
>>
>> On 12 April 2013 11:46, Andreas M=C3=BCller <schnitzeltony@googlemail.co=
m> wrote:
>>> It is Fedora 14 and I don't have the time to update the machine.
>>
>> Genuinely shocked that they shipped GNU make 3.82 without the patches
>> to make it work.
>>
>>> Since there seems no support for little poor old-fashioned people like
>>> me: Is there a configuration option so I can force to build
>>> make-native on that machine (checked local.conf.sample /
>>> site.conf.sample / yocto reference manual but did not find a hint)?
>>
>> From a quick look, BASEDEPENDS_append =3D " make-native" might do the tr=
ick.
>>
> Thanks
>
This came too early because - before I tested it. I get

NOTE: multiple providers are available for make-native (make-native,
remake-native)
NOTE: consider defining a PREFERRED_PROVIDER entry to match make-native
NOTE: Preparing runqueue
ERROR: Unbuildable tasks were found.
These are usually caused by circular dependencies and any circular
dependency chains found will be printed below. Increase the debug
level to see a list of unbuildable tasks.

Identifying dependency loops (this may take a short while)...

ERROR: An uncaught exception occured in runqueue, please see the failure be=
low:
ERROR: Running idle function
Traceback (most recent call last):
  File "/home/andreas/oe-core/sources/bitbake/lib/bb/runqueue.py",
line 300, in find_chains(taskid=3D175, prev_chain=3D[14, 15, 19, 20, 16,
17, 174, 178, 179, 175]):
                     if scan:
    >                    find_chains(revdep, copy.deepcopy(prev_chain))
                     for dep in explored_deps[revdep]:
  File "/home/andreas/oe-core/sources/bitbake/lib/bb/runqueue.py",
line 300, in find_chains(taskid=3D176, prev_chain=3D[14, 15, 19, 20, 16,
17, 174, 178, 179, 175, 176]):
                     if scan:
    >                    find_chains(revdep, copy.deepcopy(prev_chain))
                     for dep in explored_deps[revdep]:
  File "/home/andreas/oe-core/sources/bitbake/lib/bb/runqueue.py",
line 300, in find_chains(taskid=3D1142, prev_chain=3D[14, 15, 19, 20, 16,
17, 174, 178, 179, 175, 176, 1142]):
                     if scan:
    >                    find_chains(revdep, copy.deepcopy(prev_chain))
                     for dep in explored_deps[revdep]:
  File "/home/andreas/oe-core/sources/bitbake/lib/bb/runqueue.py",
line 300, in find_chains(taskid=3D1143, prev_chain=3D[14, 15, 19, 20, 16,
17, 174, 178, 179, 175, 176, 1142, 1143]):
                     if scan:
    >                    find_chains(revdep, copy.deepcopy(prev_chain))
                     for dep in explored_deps[revdep]:
  File "/home/andreas/oe-core/sources/bitbake/lib/bb/runqueue.py",
line 301, in find_chains(taskid=3D1139, prev_chain=3D[14, 15, 19, 20, 16,
17, 174, 178, 179, 175, 176, 1142, 1143, 1139]):
                         find_chains(revdep, copy.deepcopy(prev_chain))
    >                for dep in explored_deps[revdep]:
                         if dep not in total_deps:
KeyError: 1140

NOTE: Tasks Summary: Attempted 0 tasks of which 0 didn't need to be
rerun and all succeeded.

Summary: There was 1 WARNING message shown.
Summary: There were 3 ERROR messages shown, returning a non-zero exit code.


bitbake make-native works fine.

What other options do I have to force build of make-native. Why I
insist: On both of my machines (Fedora 14 / 15) build of systemd
fails.

Andreas


