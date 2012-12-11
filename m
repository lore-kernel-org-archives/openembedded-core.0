Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TiXEn-0008HA-Mt
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Dec 2012 22:19:37 +0100
Received: from mail-ob0-f197.google.com ([209.85.214.197])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 11 Dec 2012 13:05:03 -0800
Received: by mail-ob0-f197.google.com with SMTP id v19so21121926obq.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2012 13:05:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=0QsmKY8SbEr5Lt3KV8Ny28OxIutxsklrARnuJvBJ5og=;
	b=LpIzQFAN8CltbbjJw5V9IYrs5Np8uPX6hU5Cr95Vnl9ZgOh5aijlmJvC5XCeP/o8NK
	OSjf+i3SLNRjZxyscplXQsBSyrgoWkC3aOxTVgi0hTCTBK7atcju63lHG0Nd8kjamd9I
	tknTsZSmzR3pZq7KX0bKA7UFCmjTspmol+cCPAY6visYgITGBCfe47yTqW0OClfHC/lP
	BW/j+DZvUC6CCVwPRRjbiIT+JNKEBIAFJjCOZDUDitBJOBovYDC1+1DpEGUPplEOWz4W
	g44gihTptzUTdssQEwpqJSmy/UYb8L4C8hRR9LAavhGlQLB8SrZuoFHfrq+vW49aH6cH
	X8vw==
Received: by 10.182.164.103 with SMTP id yp7mr9968179obb.74.1355259902663;
	Tue, 11 Dec 2012 13:05:02 -0800 (PST)
Received: by 10.182.164.103 with SMTP id yp7mr9968176obb.74.1355259902588;
	Tue, 11 Dec 2012 13:05:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Tue, 11 Dec 2012 13:04:42 -0800 (PST)
In-Reply-To: <c59878a0a74222e7f777f8b32907080519c8d15c.1355214185.git.alexandru.damian@intel.com>
References: <cover.1355214185.git.alexandru.damian@intel.com>
	<c59878a0a74222e7f777f8b32907080519c8d15c.1355214185.git.alexandru.damian@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Dec 2012 21:04:42 +0000
Message-ID: <CAJTo0LY9j7xLBGOHAF+VvaRt_OgK9VBbhQEFM9n=NWor693saA@mail.gmail.com>
To: Alex DAMIAN <alexandru.damian@intel.com>
X-Gm-Message-State: ALoCoQnF2PiohRp3f2YyLel/bUvHANosPSfkAxsr6V3AJPLKl7Dn9O24sarY+0WnmYsHUDfyIYsn4cEY597dwRCqSkqkZOYa6mR1qbK7JeypwaeiVHwS4mSD3gcZI5Uma56OqxdUd8hA2WES6pPAcV26r4Eqfi0S/KZaF5EIOm49z0gu0VuzEIpwfz0LUd7o59vSkjrxoI01
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/8] Enable Wayland distro feature by default
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
X-List-Received-Date: Tue, 11 Dec 2012 21:19:38 -0000
Content-Type: text/plain; charset=UTF-8

On 11 December 2012 08:29, Alex DAMIAN <alexandru.damian@intel.com> wrote:
> Conflicts:
>         meta/conf/distro/include/default-distrovars.inc

Remove this section from the message.  Also unsure if we should enable
it by default right now.

Ross


