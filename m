Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SlgwD-0005Mr-A5
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jul 2012 15:45:13 +0200
Received: by lbol5 with SMTP id l5so7205930lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Jul 2012 06:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=3MxXOnYrNXkqrBmF7sYtY8GMD3P+fefyhGqx5YRqrIA=;
	b=UYdZBYe7fKWOeFxhYvwXkht4XEq1ZnQE/BTtPktO/stAmo1KU6y/zadUj8UU5BSoj5
	tlR6SrVB7ATTmbH2BQ2QrUGPa+NSPW6Q2XveEqkXp0LcPMy+PeavpS4ElRa1povbHhg4
	sKUHnvdYn+l962VenidpfrBVKXMnvhNCB8GoA/SlTMRg/xlzqEb4Lox1Pf/y5Oih3JqK
	b+3c1R8okr+Yp5Tjbqv/GtxYVWvjsHthQH11n2HOXmw8lV7AIbe7kxGqaNDgGWOCKE7u
	k7wAFeSRZbmsGyNmjyRG1RhpDwqV4E/nLQwasSMhWnjflLSz0fJMu/3v0PxLp6uDntX1
	Lkaw==
Received: by 10.112.102.136 with SMTP id fo8mr6300927lbb.106.1341236052473;
	Mon, 02 Jul 2012 06:34:12 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.64.180 with HTTP; Mon, 2 Jul 2012 06:33:52 -0700 (PDT)
In-Reply-To: <CAP9ODKot3PDg5vkz76NwNgSsy+2tn_FB2-tvaYyc1WJzW3zjrQ@mail.gmail.com>
References: <4FF0C930.4000104@linux.intel.com>
	<1341207885-9463-1-git-send-email-paul.gortmaker@windriver.com>
	<1341207885-9463-3-git-send-email-paul.gortmaker@windriver.com>
	<CAP9ODKot3PDg5vkz76NwNgSsy+2tn_FB2-tvaYyc1WJzW3zjrQ@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 2 Jul 2012 06:33:52 -0700
X-Google-Sender-Auth: r7cO7gO8kiDRk6kMXzntGLsbP6E
Message-ID: <CABcZANm5d2gQ8kdEEbcgW-KD7Puy7jZrDu82m6dHq2vVj1uagA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 2/3] u-boot: make FILESDIR a shared setting.
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
X-List-Received-Date: Mon, 02 Jul 2012 13:45:13 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 2, 2012 at 4:24 AM, Otavio Salvador <otavio@ossystems.com.br> wrote:
> On Mon, Jul 2, 2012 at 2:44 AM, Paul Gortmaker
> <paul.gortmaker@windriver.com> wrote:
>> The setting is the same in all recipes, so move it to
>> the shared settings in u-boot.inc
>>
>> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
>
> Acked-by: Otavio Salvador <otavio@ossystems.com.br>

It shouldn't be using the old, legacy FILESDIR mechanism at all.
-- 
Christopher Larson


