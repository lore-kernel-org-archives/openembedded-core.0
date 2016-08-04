Return-Path: <s.mueller-klieser@phytec.de>
Received: from root.phytec.de (mail.x-arc.de [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 7579776E4A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Aug 2016 14:52:39 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 3FB28A00303;
	Thu,  4 Aug 2016 16:52:40 +0200 (CEST)
Received: from [172.16.10.21] ([172.16.10.21])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP5 HF413)
	with ESMTP id 2016080416523887-19693 ;
	Thu, 4 Aug 2016 16:52:38 +0200 
To: "Burton, Ross" <ross.burton@intel.com>
References: <1470317274-27771-1-git-send-email-s.mueller-klieser@phytec.de>
	<CAJTo0LZ94KkvfRVUfq5cHFJ6tUKJs_JCMHWFYJACUDUHKg11_Q@mail.gmail.com>
From: =?UTF-8?Q?Stefan_M=c3=bcller-Klieser?= <s.mueller-klieser@phytec.de>
Organization: PHYTEC Messtechnik GmbH
Message-ID: <57A356B4.7070109@phytec.de>
Date: Thu, 4 Aug 2016 16:52:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ94KkvfRVUfq5cHFJ6tUKJs_JCMHWFYJACUDUHKg11_Q@mail.gmail.com>
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP5
	HF413|March 21, 2016) at 04.08.2016 16:52:38,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP5 HF413|March 21,
	2016) at 04.08.2016 16:52:38
X-TNEFEvaluated: 1
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/7] dangling patches
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
X-List-Received-Date: Thu, 04 Aug 2016 14:52:43 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 04.08.2016 16:33, Burton, Ross wrote:
> On 4 August 2016 at 14:27, Stefan M=C3=BCller-Klieser <
> s.mueller-klieser@phytec.de> wrote:
>=20
>> There are some patches floating around with no reference to it. I guess
>> one just forgot to delete them during package upgrade. They should be
>> removed for consistency.
>>
>=20
> I dont suppose you have tooling to find these, or was it manual review?

I found one and wrote a small bash script for the others, as it needs to
run outside of bitbake. Nothing special, though.
Stefan

>=20
> Ross
>=20

