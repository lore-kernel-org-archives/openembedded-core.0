Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T6lm4-0002Xa-Od
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Aug 2012 19:09:52 +0200
Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 29 Aug 2012 09:57:37 -0700
Received: by obblz20 with SMTP id lz20so1466809obb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2012 09:57:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=br3F+G0fu4ugA0C50yRSdK3P3H/j7U1iXPt8cljitJw=;
	b=kxE9yqIxqpzx4/nIvesPpZnB5CvN9Y/5vbx36B9ieleokWk+TMAZaDvMPGePwYYzrA
	8gKQvlKMUN2BGaICKeurLJ6QjCsE4fjHVs62KQ3kiGwl3mXFdh2MlIO4vXQKangKns/l
	zA2bASgoBqwM1BBQoo2pYL8m4s28sBj5g8z7nVrlcnYCVDbIWnEsbRjM4/CPyc8NcnJD
	GKcUN3Pf2/F7wJG+5JCnOR3HccBDivmbJS8+dzFuOif7yVQql3owpdvFl/cFfLOEgDyh
	Dvdp3ZOIxsV5Zw2JKt47ALkCML1hEjNPdbtqD5hncQZ/bjDa+wsQzS619qHzyoG37Oq3
	01YQ==
Received: by 10.60.28.162 with SMTP id c2mr1982932oeh.3.1346259456550; Wed, 29
	Aug 2012 09:57:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Wed, 29 Aug 2012 09:57:16 -0700 (PDT)
In-Reply-To: <FF931F2C-6ABE-4F72-8FEE-90CFCE69121C@dominion.thruhere.net>
References: <d45bc352092507d11c740fb85c37d1102fa7203d.1346250187.git.ross.burton@intel.com>
	<ba35808d6976ff17d3732ffcdb56e71f8014137c.1346250187.git.ross.burton@intel.com>
	<1D285050-76EB-4F89-9FB2-0474C5E34102@dominion.thruhere.net>
	<CAJTo0LatnKpmV5P53dsdO-J4_kMT_mqJu8SW5vX_b8KhbOJDXA@mail.gmail.com>
	<FF931F2C-6ABE-4F72-8FEE-90CFCE69121C@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 29 Aug 2012 17:57:16 +0100
Message-ID: <CAJTo0LZa4odP83UOT=1U+nan-wcOEKuRMXW3iHRv9wzD8pspDA@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmCx2g0xLz3KK2EEfu3u9K8fO0IKZt9b7iJx5G7LR9JN62JWYBj1+tTp436lfzHJAqXT67S
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] tzdata: install /etc/localtime alongside /etc/timezone
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
X-List-Received-Date: Wed, 29 Aug 2012 17:09:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 29 August 2012 17:50, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Ehm, I *really* want it to be a symlink, that way you easily check what t=
he timezone is without needing to boot the device or compare md5sums. The l=
ast thing the TSC said on the split /usr was something along the lines of "=
would be nice, but only if it doesn't make things worse". A cp instead of l=
n would make things worse IMO.

I'm all in favour of dropping the / and /usr split.  If we get a
definitive direction we can stop these arguments. :)

Ross


