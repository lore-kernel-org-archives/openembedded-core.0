Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QOWgx-00067I-CT
	for openembedded-core@lists.openembedded.org;
	Mon, 23 May 2011 17:05:11 +0200
Received: by wwb17 with SMTP id 17so5172541wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2011 08:02:11 -0700 (PDT)
Received: by 10.216.241.78 with SMTP id f56mr2204075wer.76.1306162930955;
	Mon, 23 May 2011 08:02:10 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id d54sm3316447wej.10.2011.05.23.08.02.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 May 2011 08:02:10 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <BANLkTi=X=KYL=7BQ+yRpaRE9D7QAUsQa1w@mail.gmail.com>
Date: Mon, 23 May 2011 17:02:08 +0200
Message-Id: <30D0F892-6777-491B-A414-1C44EFDDAED2@dominion.thruhere.net>
References: <1304755709.30391.187.camel@rex>
	<BANLkTi=x2xuJaGGNSq4eT5Cp2wVW0NnhBA@mail.gmail.com>
	<BANLkTi=J5nGBSUVMLSfbJo+RpsMk-OCU9g@mail.gmail.com>
	<1304756644.30391.189.camel@rex>
	<BANLkTikVXbDNTE_Nt-ptxGjeQN5_RYcp-A@mail.gmail.com>
	<1304758267.30391.190.camel@rex> <1306161789.3424.856.camel@rex>
	<BANLkTi=X=KYL=7BQ+yRpaRE9D7QAUsQa1w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: Unable to push to the repository?
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
X-List-Received-Date: Mon, 23 May 2011 15:05:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 23 mei 2011, om 17:01 heeft Cliff Brake het volgende geschreven:

> On Mon, May 23, 2011 at 10:43 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Sat, 2011-05-07 at 09:51 +0100, Richard Purdie wrote:
>>> On Sat, 2011-05-07 at 01:37 -0700, Khem Raj wrote:
>>>> On Sat, May 7, 2011 at 1:24 AM, Richard Purdie
>>>> <richard.purdie@linuxfoundation.org> wrote:
>>>>> On Sat, 2011-05-07 at 01:21 -0700, Khem Raj wrote:
>>>>>> On Sat, May 7, 2011 at 1:13 AM, Khem Raj <raj.khem@gmail.com> =
wrote:
>>>>>>> On Sat, May 7, 2011 at 1:08 AM, Richard Purdie
>>>>>>> <richard.purdie@linuxfoundation.org> wrote:
>>>>>>>> Hi,
>>>>>>>>=20
>>>>>>>> It seems something on the server was broken and I'm unable to =
push to the repository:
>>>>>>>>=20
>>>>>>>> $ git push origin master:master
>>>>>>>> Counting objects: 9, done.
>>>>>>>> Delta compression using up to 2 threads.
>>>>>>>> Compressing objects: 100% (5/5), done.
>>>>>>>> Writing objects: 100% (5/5), 490 bytes, done.
>>>>>>>> Total 5 (delta 4), reused 0 (delta 0)
>>>>>>>> remote: sed: can't read ./description: No such file or =
directory
>>>>>>>> remote: *** Project description file hasn't been set
>>>>>>>> remote: error: hook declined to update refs/heads/master
>>>>>>>> To ssh://git@git.openembedded.org/openembedded-core
>>>>>>>>  ! [remote rejected] master -> master (hook declined)
>>>>>>>> error: failed to push some refs to =
'ssh://git@git.openembedded.org/openembedded-core'
>>>>>>>>=20
>>>>>>>> Any ideas what's wrong?
>>>>>>>=20
>>>>>>> hmmm I added ml hooks but they are same as classic oe so it =
should
>>>>>>> have worked but let me see.
>>>>>>=20
>>>>>> OK I think I used wrong repo name probably that was it. Please =
retry
>>>>>> and see if it works
>>>>>=20
>>>>> No, still the same error :(
>>>>=20
>>>> one more time. Now I have added description files.
>>>=20
>>> It worked this time, thanks.
>>=20
>> and its broken again once more :(
>=20
> Its fixed now.  The root cause has also been fixed, so I don't expect
> this to be a problem in the future.

Out of curiosity, what was the root cause?=20=


