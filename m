Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TsW81-0005fI-TY
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 11:09:54 +0100
Received: from mail-ye0-f198.google.com ([209.85.213.198])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 08 Jan 2013 01:54:41 -0800
Received: by mail-ye0-f198.google.com with SMTP id l11so418147yen.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2013 01:54:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=e5BkeXavyAjTllUuZmdWD2hUFoDdwKzxl0NPkEjmkLA=;
	b=hRcLuQnSjq6Af33K+exUucJdZdb32cqnM/plg0vQg0LdUONnPBmq3RY05ziSpENaw3
	4iXgIFhoUn4bhpJbo9JJuHArYUu0PnSDtATq9w0TrU1pzsNMlsSGWru3IoNQz8fMa1O2
	yjtEKStbfzNRXNnCVJe+Xmg5Vh558nDX6d24Fp2mT5AKNE3gpPSqcKwT9fjRyMrITBqa
	CyOX3OdgBLDNiqiBLLpBBRbL/fVBADL9nDDqGW2w4WHw503oYTVLB60210FRnQzIqATl
	vkebirCd0aV+xSFiVKF4XQxCNY89qTIZxFMfetdhsolv3gHTx5QinNnN3/fQVeTvK/3p
	8vEw==
X-Received: by 10.58.239.162 with SMTP id vt2mr89002476vec.1.1357638879616;
	Tue, 08 Jan 2013 01:54:39 -0800 (PST)
Received: by 10.58.239.162 with SMTP id vt2mr89002473vec.1.1357638879542; Tue,
	08 Jan 2013 01:54:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.103 with HTTP; Tue, 8 Jan 2013 01:54:19 -0800 (PST)
In-Reply-To: <3d4ed4e62c2af3e6cafa59c07d33bb3ea6c302f6.1357574641.git.alexandru.damian@intel.com>
References: <cover.1357574641.git.alexandru.damian@intel.com>
	<3d4ed4e62c2af3e6cafa59c07d33bb3ea6c302f6.1357574641.git.alexandru.damian@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 8 Jan 2013 09:54:19 +0000
Message-ID: <CAJTo0LYtPy6q8qp01Q_fAkafeuptWLFAuWdzf+LoqRwwM7XE7w@mail.gmail.com>
To: Alex DAMIAN <alexandru.damian@intel.com>
X-Gm-Message-State: ALoCoQmv0sTFBMNA69LmQwsmhSSKzRMqwOx7TpzSuqlaauJ2wsl6U2hAIDgzZVy+5NehecwRmX0DaS+d+r+Kj/PSJJLeejbX0CLmzI3rphSHmQEgsglt+V2mC9oLSIGA2jIWGMZm9nZbTbAf4MFggknEA/aLbxFbhcyyzqu+9Ka+vuFL3KowDiOmOM/va2yi5wNOY6qdShl0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] Prepare mesa-dri for weston compatibility
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
X-List-Received-Date: Tue, 08 Jan 2013 10:09:55 -0000
Content-Type: text/plain; charset=UTF-8

On 7 January 2013 16:06, Alex DAMIAN <alexandru.damian@intel.com> wrote:
> +# if we're using a OVERRIDES = "weston" in local.conf
> +DEFAULT_PREFERENCE_weston = "1"

Don't bother.  As I've said before Mesa 9.0.1 is going to be merged
shortly (there was a failure on ARM, which is now sorted) and that can
build Wayland, so if we merged this patch *now* this chunk would be
deleted again in a few days time.

Ross


