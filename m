Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TiXFi-0008Jr-Bp
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Dec 2012 22:20:35 +0100
Received: from mail-oa0-f69.google.com ([209.85.219.69])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 11 Dec 2012 13:05:59 -0800
Received: by mail-oa0-f69.google.com with SMTP id j6so21573374oag.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2012 13:05:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=85nc/zUIn1MW4woTWefjR+CgwxGZttgeW9Y+H2O0axY=;
	b=WwtE+3uJbKDmkyflbDzAgWcTZGTLdkMBWfx3DFdmg5WkViqYfWXBgmM0b4Z5AIiMO7
	MRjMO/7rrpkyjqzqjcjBdYZxwd/8MPN+v/OHgATtbXxzOoLCyYkCk/72PvdRIiC7Zxl3
	9VyGL9yeB5ItL2b2in0AT8uwgU9KurGEqEco11EHJOrN9SKVpSj2Jbd1bgLtBfgcmfee
	cMDdKKQTkGnBDwHBb3F6p7/QYv2en0t2cehAPSGC/NEIuZt4BpIXQCTW0SivszJBZRPZ
	hKAnL2IszPjMlOgGDUeXV3+0hLwr9uLW/rwRZQZUFRZy5WqE5QQ6y+RgtDXzPFjwDdoV
	W+zQ==
Received: by 10.60.170.10 with SMTP id ai10mr10415284oec.72.1355259958671;
	Tue, 11 Dec 2012 13:05:58 -0800 (PST)
Received: by 10.60.170.10 with SMTP id ai10mr10415279oec.72.1355259958592;
	Tue, 11 Dec 2012 13:05:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Tue, 11 Dec 2012 13:05:38 -0800 (PST)
In-Reply-To: <aa5d85307115afbabead5d3f6e8fd976fe04c315.1355214185.git.alexandru.damian@intel.com>
References: <cover.1355214185.git.alexandru.damian@intel.com>
	<aa5d85307115afbabead5d3f6e8fd976fe04c315.1355214185.git.alexandru.damian@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Dec 2012 21:05:38 +0000
Message-ID: <CAJTo0La2qJLgg3VSAaO1NRPPEjShPJFd1ghEaJqP4JLp8kPHow@mail.gmail.com>
To: Alex DAMIAN <alexandru.damian@intel.com>
X-Gm-Message-State: ALoCoQlEMMfqiuRtHob8/RQt9dpjxeVwYPEp7qOIyrTkb+Zf6/XriOsqWnTP5I2ISLjD0nDSFxI5pGTVcAT9yze/9RRVO9yCmtsL9X65wDZO8CdUM7s+9kg4ofozWdWMM8tK/y3meRKLqn8j7IZ3l9NZ2F8JIhAe/ntlyv3Tdwdibv/JQNMbDcnzCgGW3NHINDtwg83WBDDy
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/8] mesa: merge internal libraries into mesa-dri package
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
X-List-Received-Date: Tue, 11 Dec 2012 21:20:35 -0000
Content-Type: text/plain; charset=UTF-8

On 11 December 2012 08:29, Alex DAMIAN <alexandru.damian@intel.com> wrote:
> From: Ross Burton <ross.burton@intel.com>
>
> libglapi and libgbm are specific to Mesa and it's unlikely that they'll be used
> on their own.  Mesa 9 also adds another internal library, libdricore, so prepare
> for that by putting these mesa-specific libraries into the mesa-dri package.

I retracted this patch, drop it from your branch.

(see Saul's latest consolidated pull or master-under-test for the
latest patches)

Ross


