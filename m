Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders.darander@gmail.com>) id 1QZ6Jl-0003Ey-6a
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 21:08:58 +0200
Received: by fxm19 with SMTP id 19so179011fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 12:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=ZGw16524vYVUEux20LF9EClLd/7XxvfCSy0wcxqnCj0=;
	b=aKJ/IIH+btgtTnbgcKKMclbRJRX6cZI141SDKVoMLVSS9sXUWvFefNAZ//IOCquBjK
	XGnPKwyxgptZ49SetJiPnl2BBs85rHNOW1sf0e4xExNu1qpWO9bShLJfrcKqpOwFZaTz
	0lFDIdbAiE9jdhur7zOIMLPPJLFUCyXxFnWYg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=I5HSs5jOJLC4U2FJDjp7+2g1o2bX2trzTCbVwVD4GTOcASbP2KezFfmjpC87ZEF/no
	t+tCU2/WYx3tFTNo8dBSVzYLrMDe59LLjfASEq2w6otIW3cSn3Cx4Bkq1biiZg1tCp4c
	9Alq0ieNgCaMN7sLA/kOLkS2aX5u811xL3bzk=
MIME-Version: 1.0
Received: by 10.223.94.129 with SMTP id z1mr4227553fam.144.1308683122917; Tue,
	21 Jun 2011 12:05:22 -0700 (PDT)
Received: by 10.223.114.1 with HTTP; Tue, 21 Jun 2011 12:05:22 -0700 (PDT)
In-Reply-To: <1308682055.3083.13.camel@lenovo.internal.reciva.com>
References: <cover.1308680000.git.anders@chargestorm.se>
	<dae7eb36362cc224e70938d345ddfbd672ad0d61.1308680000.git.anders@chargestorm.se>
	<1308682055.3083.13.camel@lenovo.internal.reciva.com>
Date: Tue, 21 Jun 2011 21:05:22 +0200
Message-ID: <BANLkTikrLbTp++UjNegyxdyNq3O=YiFs0w@mail.gmail.com>
From: Anders Darander <anders.darander@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 1/5] Remove support for building 2.4 kernels
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
X-List-Received-Date: Tue, 21 Jun 2011 19:08:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 21, 2011 at 20:47, Phil Blundell <pb@pbcl.net> wrote:
> On Tue, 2011-06-21 at 20:18 +0200, Anders Darander wrote:
>> Signed-off-by: Anders Darander <anders@chargestorm.se>
>> ---
>> =A0meta/classes/kernel.bbclass =A0 =A0 =A0| =A0 22 +++++++--------------=
-
>> =A0meta/classes/module-base.bbclass | =A0 =A02 +-
>> =A02 files changed, 8 insertions(+), 16 deletions(-)
>
> This patch looks basically fine but it has quite a lot of extraneous
> whitespace changes. =A0Could you try to filter those out in future, or
> submit them as a separate patch?

Sure, I'll try to watch out for these in the future.

Regards,
Anders


