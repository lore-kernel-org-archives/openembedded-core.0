Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Ua20A-00028P-LP
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 12:53:43 +0200
Received: by mail-vb0-f47.google.com with SMTP id x14so1408100vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2013 03:35:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=qEvvvX/K18ZgAco6gFSg0mMD9z2+WqsnFQaXwer8kAU=;
	b=oX04f0OeTaSEJxXB1Ln3QIC3e2MEIVHWnlxver3PNVCiaEshLSEsq8ix5hbQ28Tx7j
	Hgawx502aRW2CJGSuXCjKkpZVJnjRrYgIyOOgE8OZeFI+GUviTqs8oEJjW9pmRkHwJEm
	3z4b6PYCCsbxbbKivEnGNqyDDy0+nME4iVa5umwjdXwIbWSbpDl2A1AIfdmHgvDMFYpI
	xYf8Dx4cUj4EqRR6SLdqmQLtt3JN6EOefYUmzXuwFQ3gTBRuq4MvvxIhXSIdW+AyH1HW
	CCMTZmEvvElfAmc4XUlxoxqOqDzsdu0PfXViS1go4prNISU8FAmFdPyiyjFV7ketBUkk
	SNNQ==
X-Received: by 10.52.117.212 with SMTP id kg20mr3473071vdb.55.1368009336104;
	Wed, 08 May 2013 03:35:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Wed, 8 May 2013 03:35:16 -0700 (PDT)
In-Reply-To: <CAHUNapTCr_YV+pfCJod6LcGfhGh4HEX+GmcQSFQ9frFS+HiecQ@mail.gmail.com>
References: <1367930701.27116.31.camel@ted>
	<CAHUNapT--78aOf=eCava7w9VsHAD8fL3odbreW-6EATt6mujbA@mail.gmail.com>
	<CAJTo0LaUSyekgycP37-jZnHmgy1wOM-PfJ0yZQtMrSP_bUp8hg@mail.gmail.com>
	<CAHUNapTCr_YV+pfCJod6LcGfhGh4HEX+GmcQSFQ9frFS+HiecQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 8 May 2013 11:35:16 +0100
Message-ID: <CAJTo0LaHKGS+FRWJX9yE29sdSSVR6R4JsykHOx9N6RpaBuEn+g@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
X-Gm-Message-State: ALoCoQnfWjTvYQjKgyYhuhuMRIDsG6xt/bg7afCBOKgErIAlV+HMHxSIoXrC6EkoHv+a64XWvICx
Cc: yocto <yocto@yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] Status Update
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
X-List-Received-Date: Wed, 08 May 2013 10:53:44 -0000
Content-Type: text/plain; charset=UTF-8

On 7 May 2013 18:57, Trevor Woerner <twoerner@gmail.com> wrote:
> I've looked through the list of patches and don't seem to find
> anything that will do what my patch needs to do in order to build
> qemu-1.2.0 on openSuSE 12.3. Would you consider adding the attached
> patch for Danny? (normally I'd send it in-line but I'm behind a
> firewall at the moment that won't allow "git send-email" to succeed,
> otherwise I could submit it this evening)

Merged to my danny-next branch, after confirming that this isn't
needed in Dylan/master as qemu 1.4 has the -lrt linkages declared.

Ross


