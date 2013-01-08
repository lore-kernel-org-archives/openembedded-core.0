Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TsWCR-0005oq-Vm
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 11:14:37 +0100
Received: from mail-qc0-f197.google.com ([209.85.216.197])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 08 Jan 2013 01:59:16 -0800
Received: by mail-qc0-f197.google.com with SMTP id x40so463326qcs.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2013 01:59:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=4Zg5p98XqqdvXwQyZWCCUwHjQniTzLv1SoTKRSeW4Ko=;
	b=jLi6+ZlPLiLZp+VhsMPbA8OsNyHYLE/h0nWVOaHgVs6EA8OwH5JiKuj6MvyZznuuQl
	/lo3vyRQm4vnWbj859f9dcNjLfSc00kv9F5+H6pzvzgQISNP7B8Tz0qPjynHK90bABSs
	RUbxubRBMdS1nFN7PV+Jg2g6htEpexFWklNnwchIa1l+okTmXVK6WQGBXlRZC9Y9Uor0
	1IkL93iH+MsYd3NYfmNqxP2ijca8PG8h6SDIbxz9lrxKM7EbolmULf/mszRpxLvpdNXH
	GPDwV7Qo6YpLAs0gOSRALdav3dUMXRoVGp5x+AQPShZ1TCjtv75G134tkM5r2G8lZeVL
	XAtw==
X-Received: by 10.58.30.7 with SMTP id o7mr88901423veh.19.1357639155255;
	Tue, 08 Jan 2013 01:59:15 -0800 (PST)
Received: by 10.58.30.7 with SMTP id o7mr88901422veh.19.1357639155174; Tue, 08
	Jan 2013 01:59:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.103 with HTTP; Tue, 8 Jan 2013 01:58:53 -0800 (PST)
In-Reply-To: <6b9684a5239103564b499be51bfe655bf89abea4.1357574641.git.alexandru.damian@intel.com>
References: <cover.1357574641.git.alexandru.damian@intel.com>
	<6b9684a5239103564b499be51bfe655bf89abea4.1357574641.git.alexandru.damian@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 8 Jan 2013 09:58:53 +0000
Message-ID: <CAJTo0LYE36diEmQSxYjaq6c5nJ9UXesiHxV+_GvRkSHwVPJnUA@mail.gmail.com>
To: Alex DAMIAN <alexandru.damian@intel.com>
X-Gm-Message-State: ALoCoQnsV1zyip/47sReZ4nd1RJeBZjt6suU+4g2mrsQmDjreqaIFt1iOCh0Ro+jzotpRZXRBcAatWc0S6LdgTzDHFmMLa5x7+qA93VbQSG4occi5df6/Uq1+x1H8OQuU0YLkWzk0w3jv0DcX79f+x+Be60VjAkEmCl63yStgHhR8zTf/cT7L084j5UAFPu6U78s9TPwvSVD
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] Initial commit for wayland/weston 1.0.3
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
X-List-Received-Date: Tue, 08 Jan 2013 10:14:43 -0000
Content-Type: text/plain; charset=UTF-8

On 7 January 2013 16:06, Alex DAMIAN <alexandru.damian@intel.com> wrote:
> From: Alexandru DAMIAN <alexandru.damian@intel.com>
>
> This patch adds the Weston reference compositing
> manager from Wayland.
>
> We add version 1.0.3 which is the latest stable release
> in Dec 2012. See the upstream at:
>
> http://wayland.freedesktop.org/releases.html

Remove this, it's obvious from the commit which version you're using.

> To enable building, set in local.conf
>
>  #Build mesa-dri compatible packages
>  OVERRIDES += ":weston"

As in 2/3, don't do this.

>  #Enable the wayland distro feature
>  DISTRO_FEATURES_append_weston = " wayland "

Surely you want the wayland feature globally, so that mesa builds with
Wayland support?  'To enable wayland, add "wayland" to
DISTRO_FEATURES.' is all you need.

Ross


