Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f53.google.com (mail-oa0-f53.google.com
	[209.85.219.53])
	by mail.openembedded.org (Postfix) with ESMTP id D64FC6D608
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2013 18:51:54 +0000 (UTC)
Received: by mail-oa0-f53.google.com with SMTP id j17so2586646oag.26
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Nov 2013 10:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=DC+BcvZVfnFQuYbeY5/GHv/H47Jfm2PQVIjkVNNpVPo=;
	b=UolaLW9tcy+/m6wWg5B9xWnpqaRu7hkLjXTo8CRUG6kykXpqjViZEU1oJP3WH3t5CT
	5lpNQDWykzqzPJ6drndVhexdW0QJlglDrgy0l51T3kDeatRBTEnpPKiX7xOriS9zjwLR
	D5386wgHodhraJTCXztJsVCSjZFXlTnkUbXTY5Q36IGyuUJdOsqaeaxOWGoxwfLx6AD3
	fVuVv8+mWhLHApGmE8K2hRp2YkE886hOqyUeuG996zLPaeJRPEWZzha1M9zPJsjaznFu
	9JVyr17GqXdfjBbCaK4hHtkdpFvmqf5e+5P7dyGpIPTkTa9OQ8I2nIyuJd+YewROgCjA
	zGeg==
MIME-Version: 1.0
X-Received: by 10.60.134.42 with SMTP id ph10mr70287oeb.76.1383763916482; Wed,
	06 Nov 2013 10:51:56 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 6 Nov 2013 10:51:56 -0800 (PST)
In-Reply-To: <1383689722.6271.184.camel@ted>
References: <1383689722.6271.184.camel@ted>
Date: Wed, 6 Nov 2013 16:51:56 -0200
X-Google-Sender-Auth: VD1aJEA2YH2DnjIY8wmbmYPmze8
Message-ID: <CAP9ODKrLg1nb5syAUtM4_ipMKenTe1ejXmVsVrqGifiSpBqYjA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "Eggleton, Paul" <paul.eggleton@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: lib/oe/sstatesig: Ensure packagegroups don't continually rebuild
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
X-List-Received-Date: Wed, 06 Nov 2013 18:51:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Nov 5, 2013 at 8:15 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> packagegroups are allarch and shouldn't change depending on the target
> or machine selected. In general they should have good stable namespaces
> for their dependencies. As such we can exclude them from rebuilding when
> dependency checksums change.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

What about machine-base and core-boot? this may change depending on machine.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

