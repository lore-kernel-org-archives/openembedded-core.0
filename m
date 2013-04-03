Received: from mail-vb0-f43.google.com ([209.85.212.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UNMAO-00048e-PA
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 13:47:48 +0200
Received: by mail-vb0-f43.google.com with SMTP id q12so346922vbe.16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2013 04:30:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=2Y9Tz+eOJOEK3dGqD/8FYz4ICL3vcstpz10Py1xoiII=;
	b=PJsOg5cpjA9gvWDdv6lIwSKi5QIhmOy9Im4Vu3GZ0s1HdB5BOH0kLnuDUfRn9G+JAe
	bPpUr7mTPRcpcaKxtmwre6eIp9EPWAHILRVCbYyAphyZv5OJRsCaAgepiGzZXov8F69X
	qcUJlfGbSI0tjgmfPNSMWaS2gPJNwp3PWetyNPQPjMIZLQcvqWEVmOLuPpEXHW+Abt9d
	J+aZhVTu8nYdEsNVNAyzktK0jbwvCGstLKDku9Pw0hU6DGAXau+LpEOGp3y8c17DIHlO
	0HQfjsD2JV+B01u3J1zwVHdBrsWTfIGx4wNgBbuFplfUnrvU2JetL6e1/8lUDioqYtMT
	05hg==
X-Received: by 10.58.12.69 with SMTP id w5mr878703veb.16.1364988637289; Wed,
	03 Apr 2013 04:30:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.134.74 with HTTP; Wed, 3 Apr 2013 04:30:17 -0700 (PDT)
In-Reply-To: <1364949284-32569-2-git-send-email-ronunes@gmail.com>
References: <1364949284-32569-1-git-send-email-ronunes@gmail.com>
	<1364949284-32569-2-git-send-email-ronunes@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 Apr 2013 12:30:17 +0100
Message-ID: <CAJTo0LY14UsodYqHO2iEZfiZCfHVKG6XXNbPCRU95tWP=-qoZg@mail.gmail.com>
To: Rogerio Nunes <ronunes@gmail.com>
X-Gm-Message-State: ALoCoQlNomTxjhVE6EzociAsmA9CU3uvxrZLQOSCeI6fs0Pgg7efzPA+qFCIKxiRYgvOvZ3gvEaI
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] gst-plugins-bad: disable librsvg when x11 is disabled
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
X-List-Received-Date: Wed, 03 Apr 2013 11:47:49 -0000
Content-Type: text/plain; charset=UTF-8

On 3 April 2013 01:34, Rogerio Nunes <ronunes@gmail.com> wrote:
> librsvg depends on gtk+, which in turn does not support framebuffer
> as backend in current version (2.15.24). This patch disables librsvg
> when x11 is not in the distro.

One of my plans is to make every optional dependency a packageconfig
option in the long term, so feel free to do the rest whilst you're
there! :)

Ross


