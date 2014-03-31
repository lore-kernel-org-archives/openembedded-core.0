Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f46.google.com (mail-qa0-f46.google.com
	[209.85.216.46])
	by mail.openembedded.org (Postfix) with ESMTP id AECFD6F7C6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 17:31:39 +0000 (UTC)
Received: by mail-qa0-f46.google.com with SMTP id i13so8208620qae.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 10:31:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=4Vz4j+IN8nitp/D6Bz4FRxM+FUCLRTo/5V7byj4+W1s=;
	b=FHHGUD2tsiVOst9eOuMpbloo0KB8dMxcDb542fHEPlqhU7tFmnO2SOrDtGOQmO0j9L
	+yZRpfFZpjopZ7BjsAyKOCLvUNylZRLi5VPTdXqqfzFbVyhZfgen4wErdKLWkZLL6kkM
	t6I0ndedoQylctx8hdiTV9OPfIdjo5P1jYGDLLdyguKsiAG1WSp+XnIQWw1uptu7y28k
	MGu0o9Bt13HbnqydZitjDj3ZflSPD9IIRB7kM3BTnlo5nlRP7k8dElPmS/Z2rFxEcT2/
	XZa3KBa+LhjcGhIRrgyGTGnW0UsTzer++6LK+l88OJ6s2h+B5ZVicjpeazFqtXT7jHDx
	gEMg==
X-Gm-Message-State: ALoCoQlmc/R31j+kSpsgNPN0kFk8thYt3DYA3ry7goyCNItPS0S0gmwbPgV9wwdXsoEC2C1TaCtT
X-Received: by 10.224.75.5 with SMTP id w5mr10219860qaj.52.1396287100034; Mon,
	31 Mar 2014 10:31:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.27.167 with HTTP; Mon, 31 Mar 2014 10:31:18 -0700 (PDT)
In-Reply-To: <1396285412.14790.83.camel@ted>
References: <cover.1396259433.git.cristian.iorga@intel.com>
	<1396259888.14790.58.camel@ted>
	<1396267153.6418.5.camel@firebird.rb.intel.com>
	<2505811.xE1RLRgDA1@peggleto-mobl5.ger.corp.intel.com>
	<1396285412.14790.83.camel@ted>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 31 Mar 2014 18:31:18 +0100
Message-ID: <CAJTo0LbWk+JrhRJwGVtbUJYBYR4qtmCj+tYy8gTnNAqfByGk_w@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] core-image-lsb: enforce pam as a needed distro feature
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
X-List-Received-Date: Mon, 31 Mar 2014 17:31:39 -0000
Content-Type: text/plain; charset=UTF-8

On 31 March 2014 18:03, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I kind of disagree with that, the LSB image can take into account
> configuration in other parts of the system. If pam isn't configured, I'm
> not sure that should automatically make it completely unbuildable...

An image that claims to be LSB compliant but due to
not-immediately-obvious DISTRO_FEATURES isn't actually doesn't seem
like a good idea to me, fwiw.  If the LSB image requires PAM, X11 and
so on then it should require the features.

Ross

