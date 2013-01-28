Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TzrOs-0000ig-MK
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 17:17:43 +0100
Received: from mail-gg0-f200.google.com ([209.85.161.200])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 28 Jan 2013 08:01:58 -0800
Received: by mail-gg0-f200.google.com with SMTP id k6so4008268ggd.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2013 08:01:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=NkJubPz13zQOKN7DeNuQW6NUWj0+Z4FJ6YnFcpBMPsU=;
	b=dItLuGwuY5RZm5LW8M21LNOml7hR7jpg7/vlFka22c9S8pc+J7LYyBeFs9O4NHccuS
	kpyISyQI3h88jv4ajZbtye55FoXru2fqulKkM2FOrXe510yYvELhcjBsi8HLdi1iHWzp
	MyR1clcL81AmkByNk1hbUAB43vZcYWdYZi6RDdnKP1AFzMjHPGyHerqplBfU140+fnQx
	pPDGkYJ1wBZxC/+wEPxuoDhZPfS+7TIwtEtp55uFkGkoPCKZxRlP4fziPc4WLwFKE5sG
	H6egtD/5XsMZkcUCiixiVwu7OU3hCUHUKsTM3fdfl2pPLu9+W6RtXy1J568XpvnCohF3
	X33g==
X-Received: by 10.52.66.71 with SMTP id d7mr13397488vdt.121.1359388918097;
	Mon, 28 Jan 2013 08:01:58 -0800 (PST)
X-Received: by 10.52.66.71 with SMTP id d7mr13397481vdt.121.1359388918019;
	Mon, 28 Jan 2013 08:01:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.205.236 with HTTP; Mon, 28 Jan 2013 08:01:37 -0800 (PST)
In-Reply-To: <1359388422-30017-1-git-send-email-cristian.iorga@intel.com>
References: <1359388422-30017-1-git-send-email-cristian.iorga@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 28 Jan 2013 16:01:37 +0000
Message-ID: <CAJTo0Lacg32qpbnd3+OzCSxUCaAxF4Szmg2e3CoX_y7cv6i9rQ@mail.gmail.com>
To: Cristian Iorga <cristian.iorga@intel.com>
X-Gm-Message-State: ALoCoQmFvGAWjovigSRtjdk7W3AlcCMMTW0dyDNjOmQIPZLslaXLosAIj30LqTSRF1WunxLlmjBYDkuad5ZtJvHXJ/jfaI+IyqWCrm7u9vKLHi/8K4tTnSowZhoN4H9Ngiaj9w7ycwVYM+AYpZ/zlsC2JFlbWuJnjK0O0yF90kj6DQ+Tn9j3I+jHOrcaysrqvoeriHDvTQ5w
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] alsa-tools: upgrade to 1.0.26.1
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
X-List-Received-Date: Mon, 28 Jan 2013 16:17:43 -0000
Content-Type: text/plain; charset=UTF-8

On 28 January 2013 15:53, Cristian Iorga <cristian.iorga@intel.com> wrote:
> +    export AUTOMAKE_DIR=${STAGING_DATADIR_NATIVE}/$(ls -1 ${STAGING_DATADIR_NATIVE} | grep automake)

As far as I can tell, -1 is implicit when piping.

Ross


