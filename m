Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SWV6T-0004Dj-Ep
	for openembedded-core@lists.openembedded.org;
	Mon, 21 May 2012 18:05:01 +0200
Received: by wibhm14 with SMTP id hm14so2229485wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2012 08:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=25V/LTEmTZGeLjtmU+fNWspGIfvBjdcNAwPCv+XumLs=;
	b=h0PhBxgUpHgvNVscqu/74T9RJx0YHVt9hi0jgQgHbcSA+/7j9zKaJnBqWfyGY9lyfb
	ErHXbHdQikLk+BMrn4aDc9EN/Wc+I/0IEVrnubIij1aFfzrL2Mwod8lMsFBuzB/pOjJP
	Nw5ttaXIEcv1U+ME0WbpyJvKzpxr5iUyX1fWiCWjtdK6Apv3+WV1OaaJOOIQhWhTbtHH
	qQBAJKVVcynII1D4oZKCXt5JnvjDFnXnYHc2SDLr7xuw5/ESfe3fVBu1iBNv2kvIV740
	rGnYB2LAw2y3+3TxsBu4o0ilymC4y7rtaI3c1K3NFEb0zxRJ42SFuQ+0+/sSsVZxdgqy
	SDHQ==
Received: by 10.180.24.39 with SMTP id r7mr26299516wif.9.1337615693929; Mon,
	21 May 2012 08:54:53 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.181.16 with HTTP; Mon, 21 May 2012 08:54:33 -0700 (PDT)
In-Reply-To: <4FBA63A2.9090005@windriver.com>
References: <cover.1337581961.git.sgw@linux.intel.com>
	<4FBA63A2.9090005@windriver.com>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 21 May 2012 08:54:33 -0700
X-Google-Sender-Auth: -hBV12aH3NySVnMr7X76hcadNw4
Message-ID: <CABcZAN=0JDHip7=E99Dh_mNUgkmtny5z0HbyEq0uh2_+-ehsUg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC v1 0/1] Reorder ${PN} and ${PN}-dev
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
X-List-Received-Date: Mon, 21 May 2012 16:05:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 21, 2012 at 8:47 AM, Mark Hatle <mark.hatle@windriver.com> wrot=
e:
> On 5/21/12 1:42 AM, Saul Wold wrote:
>>
>> This RFC is the first pass at reordering the above 2 items in
>> the PACKAGES list. This is in part an out cropping of the bug
>> #2367 (https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D2367),
>> which show the miss packaged pcap-config file.
>
>
> I've often wondered why the order is the way it is. =C2=A0If I were to do=
 this
> from scratch, I'd move the ${PN} item to last in the default order. =C2=
=A0Have
> you considered this more radical approach, that would then allow all of t=
he
> default splits to occur before the ${PN} processing. =C2=A0(It might also=
 allow
> the ${PN} to simply be a "/*" instead of more complex rules.)

This would be quite nice, if we could pull it off without breaking
anything horribly.
--=20
Christopher Larson


