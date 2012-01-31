Received: from mail-tul01m020-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1RsH29-0000Hu-9z
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jan 2012 17:58:17 +0100
Received: by obhx4 with SMTP id x4so200001obh.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2012 08:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=OQKMls6JaN708a39nzcNS4Ksxz8A5FWaypKPytbgkHc=;
	b=uHQyvHYLqQCEe2PEQ1QK2X/durqartXayuxAI8bytEMcWuH70e0VC9iHTUot29MrrN
	qTQdZZ3Y4J0tzX8EPtmp4Aut03ZFTiQBPFQ8CoXQgqLnj5MUnfkvAXTgy0qx0bu4pfWx
	+nC+wL+1aDK18Q1fsyYGry9slOy6dSK/pOYNg=
MIME-Version: 1.0
Received: by 10.182.11.41 with SMTP id n9mr36063599obb.24.1328028622709; Tue,
	31 Jan 2012 08:50:22 -0800 (PST)
Received: by 10.60.3.228 with HTTP; Tue, 31 Jan 2012 08:50:22 -0800 (PST)
In-Reply-To: <20120131074216.GB4166@ad.chargestorm.se>
References: <1327957970-15159-1-git-send-email-steve@sakoman.com>
	<4F27108D.4090303@linux.intel.com>
	<4F2715ED.9030109@linux.intel.com>
	<CAOSpxdajJLZSuzZS5qb4UPpjuS55ZWB=RR3a0oi9hNDF8J++Fw@mail.gmail.com>
	<4F272E1A.6040702@linux.intel.com>
	<CAOSpxdZsOeOWuB5EcjFf5cN6kkMWzAaWXYue5m2OX_jwWQZEfw@mail.gmail.com>
	<4F275EB2.1020308@linux.intel.com>
	<CAOSpxdYTX7-CAxEe=7TiFV3QN_0M_LTFfgA8nq-YS3Q7zk+a3A@mail.gmail.com>
	<20120131074216.GB4166@ad.chargestorm.se>
Date: Tue, 31 Jan 2012 08:50:22 -0800
Message-ID: <CAGDS+nmGBsC8r6yTYaSzNyDuF61A1jLL+Q+rJpDM4kb8ufAYWA@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 0/3] zypper: support signed repositories
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
X-List-Received-Date: Tue, 31 Jan 2012 16:58:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2012 at 11:42 PM, Anders Darander <anders@chargestorm.se> w=
rote:
> * Steve Sakoman <steve@sakoman.com> [120131 06:32]:
>
>> On Mon, Jan 30, 2012 at 7:23 PM, Saul Wold <sgw@linux.intel.com> wrote:
>> > On 01/30/2012 05:39 PM, Steve Sakoman wrote:
>
>> > I will wait to pull this until I hear back from you with another pull
>> > request. =A0Thanks for digging into this, better to get it solved now =
then
>> > figure it out later that we missed a GPLv2 dependency.
>
>> I'll do a build with the libzypp RDEPENDS change and verify no issues,
>> and then a test build with the gpg2 -> gpg change and verify that too.
>
>> If it works, then that patch should likely get bundled with the
>> introduction of a GnuPG V1.4.10 recipe import from oe-classic.
>
> I think you'll have to modify the oe-classic recipe to use GnuPG v1.4.7,
> as it seems that GnuPG was relicensed to GPLv3 in 1.4.8... At least that
> was the conclusion I came to when I looked at this last summer.
> (Unfortunately, I didn't have time to work through it).

This makes me wonder whether libzypp/zypper is an appropriate long
term choice for those who want to avoid GPLv3.

The zypp project obviously made the choice to switch to GPLv3 years
ago and it will be an ongoing problem to try to support old versions
with GPLv2.

Perhaps yum would be a better choice for the GPLv3 averse, since IIRC
it is still GPLv2.

Steve


