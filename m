Received: from mail-vb0-f43.google.com ([209.85.212.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U3mVd-0005eZ-8r
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 12:52:55 +0100
Received: by mail-vb0-f43.google.com with SMTP id fs19so2252664vbb.16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2013 03:36:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=55t9x+GCYXOPa8yDa34RpOsW2Yp3oFyEB83PkezNXVQ=;
	b=m5UKWCSBbRdx5CCL0ePavgP5qCyL9c+uFYyk5BPRzxxk93VnPwO42yGqQeE9J87FXt
	f3REyFaC7eZRtO3nDTxZF7JwMTEAfcGUKcMTPALim+oUu5f+auFKOPnjwk692zYRQE2Y
	ruiFQ+AChngUI9y7MN3clPa9Yq/8c3sIB/g347GfqbTrcUAt+H9AXztZVb/LbACIXZpi
	EpxLoS9BZM7gcLXLjlAh7fpMKwcDyfABcjTQ9esO6F35evTS6OnkVFseLx4nOkzuDXr0
	W0pgHCiw4T+36Q9kdHT7MWebl+WWjdwW//HCZ8YfL9AdinfxaUu3XYZUwCMVI5goeIjX
	jzoA==
X-Received: by 10.52.90.243 with SMTP id bz19mr5294702vdb.112.1360323415280;
	Fri, 08 Feb 2013 03:36:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.131 with HTTP; Fri, 8 Feb 2013 03:36:35 -0800 (PST)
In-Reply-To: <1360323133-28592-1-git-send-email-otavio@ossystems.com.br>
References: <1360323133-28592-1-git-send-email-otavio@ossystems.com.br>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 8 Feb 2013 11:36:35 +0000
Message-ID: <CAJTo0LaOcn5Kr64Ga7zfuP5q1ixO8Ag4Uy+JrOmDe7AEhDDmpQ@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Gm-Message-State: ALoCoQluqDLI8cQ1qP40C8Duiu7xAugj5cev/SkOhWPL+dBQX50HLRSw3d/zx503HO/mIRjIv+ul
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] tzdata: We shouldn't override the localtime if it is valid
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
X-List-Received-Date: Fri, 08 Feb 2013 11:52:56 -0000
Content-Type: text/plain; charset=UTF-8

On 8 February 2013 11:32, Otavio Salvador <otavio@ossystems.com.br> wrote:
> The code where mistakenly replacing the localtime file setting so we
> end with a copy of file instead of a symbolic link. This fixes it so
> now, we'll only do that in case the link is pointing to invalid data.

Can you fix the code to symlink instead of copy?  systemd and more
needs a symlink so that it can identify the name of the timezone from
the link target.

Ross


