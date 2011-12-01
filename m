Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RWDM8-0004Cg-E6
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 21:35:44 +0100
Received: by qaea17 with SMTP id a17so5081297qae.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2011 12:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=RNcGHdEPQXTv/c9xjLkJm8H3sjGy7B7Vn8GtzWatqBE=;
	b=pJIemKRxrGsBoMUy5Zle5KmenUdXVL3Rm/3A0wpMWRg2mtaAVx8f/bANe4HIp5MDJP
	z6aeZS0EEFZ2w1OUiseJn8oaZBXFGaOWAvqlhvW2qOF+UfbJw58Y50S1G3H5oKyN+150
	c+0eQWjlQfM7AvvcG7wSHLNENkBu6imCLLwbs=
Received: by 10.224.111.136 with SMTP id s8mr413832qap.98.1322771341887; Thu,
	01 Dec 2011 12:29:01 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.73.200 with HTTP; Thu, 1 Dec 2011 12:28:40 -0800 (PST)
In-Reply-To: <CAEsOVNcBUYn3K2hBoSGcGW5f4tqqn1rYg9w2U3u6RcdThgA6=g@mail.gmail.com>
References: <95547EE2-9E3E-4FB6-AA2A-A9653029F971@dominion.thruhere.net>
	<CAEsOVNcBUYn3K2hBoSGcGW5f4tqqn1rYg9w2U3u6RcdThgA6=g@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 1 Dec 2011 13:28:40 -0700
X-Google-Sender-Auth: xPj-IXH02E6gUDcsEMJnD0A-6n0
Message-ID: <CABcZAN=-Zjx3iepqyS9KXFTwGLe67ayOrFvP0t6+DP8aWnG33w@mail.gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Coordinating inter-layer dependencies
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
X-List-Received-Date: Thu, 01 Dec 2011 20:35:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 1, 2011 at 12:55 PM, McClintock Matthew-B29882
<B29882@freescale.com> wrote:
>> To avoid stressing out RP and Sau! I would strongly urge layer maintaine=
rs to respond to recipe update patches with "I have a bbappend, but my revi=
ew process needs time, please use the above proposal" if you need time to t=
est and update =C2=A0your bbappends.
>>
>> We're all human in the end and timezone differences aren't always helpin=
g with these kinds of problems, so let's work together to minimize parsing =
breakage.
>>
>> Related to that: Please include information on how to send patches upstr=
eam in your layer/repo README. The meta-intel/emenlow lacks that and the to=
p level README doesn't mention that there are sublevel READMEs.
>
> Why don't we make a version of bbappend that applies to all packages
> with the same name? This would fix the constant changing
> netbase_vXYZ.bbappend issue.

I'm pretty sure going by filename was a conscious design decision in
bitbake, to keep things simple and avoid the need to parse up front
before being able to determine the appends to use. RP would know the
details.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


