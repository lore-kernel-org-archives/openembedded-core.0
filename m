Received: from mail-vb0-f45.google.com ([209.85.212.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UCrUv-0006oF-N2
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Mar 2013 14:01:38 +0100
Received: by mail-vb0-f45.google.com with SMTP id p1so1271764vbi.32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Mar 2013 04:45:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=J8jJop+6P2A7wwPCPdNcc9K1wTJzbbSRiJiykwvadpU=;
	b=Zh246bmG3s39h9kiBBxOmsGK+QImRKjT76eEDMJZQEmHMAQL5EPyFGf2lNO4VqnUXy
	CGbbgD4TSMqGwS2hcX7/QaqauPEYAR960DWlnv4wYj4AiR1E91TUOrvhy4hEDKIs6pIs
	9/ztrrXQPgJzpDIbG5AIXARY/cwhog1DMuVP+6/HuiRHtD7vRefHK6dxh1pDIjCoXHRx
	7fF4hj8IF1vM90Q3ig+Yr95MhUcdXkMnRBClxRwJYnQXAtB9N8psza1VY5+JOTm298M/
	GgEPBHBWGMxw/PTdstGZLjfXy5CjBjTyszUw4wYNOjPZNOagXNBvS9U674/yFwLT4lQr
	0vsw==
X-Received: by 10.52.93.20 with SMTP id cq20mr8303965vdb.38.1362487508133;
	Tue, 05 Mar 2013 04:45:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.219.195 with HTTP; Tue, 5 Mar 2013 04:44:47 -0800 (PST)
In-Reply-To: <1362486294.29587.91.camel@ted>
References: <1362486294.29587.91.camel@ted>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 5 Mar 2013 12:44:47 +0000
Message-ID: <CAJTo0LZ5V1wXUan0FGKQy3Xb+r0=gp0845XOi_cT9sCroWa62w@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Gm-Message-State: ALoCoQmY/yQWmG78fs3PaKJ1w1Wis1GoK6PlCcl/6XwbR7A2cBRhMnUk6pCLzosldaGRKJOurIZe
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package.bbclass: Fix do_package variable dependencies
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
X-List-Received-Date: Tue, 05 Mar 2013 13:01:38 -0000
Content-Type: text/plain; charset=UTF-8

On 5 March 2013 12:24, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> When the do_package function was split into different sections, the vardeps
> were not updated to match meaning some function changes weren't reflected
> in the sstate checksums. Fix this.
>
> [YOCTO #3980]

Signed-off-by: Ross Burton <ross.burton@intel.com>

Ross


