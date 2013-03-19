Received: from mail-vb0-f43.google.com ([209.85.212.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UHu4m-0003Mi-U6
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Mar 2013 11:47:41 +0100
Received: by mail-vb0-f43.google.com with SMTP id fs19so197432vbb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2013 03:30:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=XjO31hHprwto6VF1osD4ddSmf2hlQe6d8Qhbz8vAnls=;
	b=YpGjQGc+trwqUjfZWPqcb9IL6p40FrBQ642TPW+p2wFozDnMIB+PVivnOOZBezdIyZ
	4D2jKB9aWwUfiOnJJDb9ZPMeogYuGGu5AcQa3pt7VpD7U1URSV1L3E6pcNPpAVg/PH+g
	EH07DUylGfCrji65abgosYZr+fs5gfNPZ9+7h3AEQjn696r0aOHLyJ+SQzl8V5r0FbKD
	iJIkDJwwfa+FFiHqvAhbasBolQrYl/MFttyt5km5O2XLmBtv2WY7bfNFUSMr9HHqhT+a
	hdwfhdNT2m+6q31H9kdwxrPXVPuqpYOr3PyJefvbZjncsdQivzziJQI07p2gw3rJ/nGb
	FUIA==
X-Received: by 10.221.2.71 with SMTP id nt7mr1668602vcb.71.1363689039223; Tue,
	19 Mar 2013 03:30:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.125.102 with HTTP; Tue, 19 Mar 2013 03:30:19 -0700 (PDT)
In-Reply-To: <1363613958-20200-1-git-send-email-jukka.rissanen@linux.intel.com>
References: <1363613958-20200-1-git-send-email-jukka.rissanen@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 19 Mar 2013 10:30:19 +0000
Message-ID: <CAJTo0LY48DEoi0M1ZkS5CmnS9jye333wddG=78c85vAb6JD5Rw@mail.gmail.com>
To: Jukka Rissanen <jukka.rissanen@linux.intel.com>
X-Gm-Message-State: ALoCoQlpBwwkHPSFUEeGq0f7l20fsy1r5UULF46vE2+pQAnPnFL6CD1pd0f1R9/NPEhya3iczlE0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman-conf: Initial systemd support
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
X-List-Received-Date: Tue, 19 Mar 2013 10:47:45 -0000
Content-Type: text/plain; charset=UTF-8

On 18 March 2013 13:39, Jukka Rissanen <jukka.rissanen@linux.intel.com> wrote:
> Create IPv4 address for ethernet in qemu image when systemd is
> in use.
>
> Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>

Please patch oe-core instead of appending in meta-systemd.

Ross


