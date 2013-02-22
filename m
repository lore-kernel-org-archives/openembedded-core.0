Received: from mail-vb0-f44.google.com ([209.85.212.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U8pYq-0004SO-VQ
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Feb 2013 11:09:06 +0100
Received: by mail-vb0-f44.google.com with SMTP id fr13so298167vbb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2013 01:52:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=Fmv3VMFAlNBpraNsC7fovk8BrusjQEabtznj8cxIHb4=;
	b=PTZCdAbNHkS6og62E9Oezc1wcF+rNb0wE53/kQI9iOA6qUnRiWWZdF4X7V9tj7w+1V
	+6Qzmkb1C1jTV5Rqh15inbNDEMxMW/SQL0nJEajgJG/Uq8T1eJwr03tS9N0GOh1LSEzh
	jyz+XNXSVoFw53dimQBOadWPzFkP7CKD3mqEUO/84GfqnaokUQrvwaUW4PKZF7b1YBA5
	S50tV2T8ofjZKbt/RDpEIfdGWfFxiRTqMfh79P7qfWC0qRpWabK7OWCDrKIJCZbc3bBz
	GkRoalwFi8b/OmxmyCPVnLPDu33bNCREN3RnoITrEFeHsdBkLontj06FDMUtE8u3o7Yl
	mSmA==
X-Received: by 10.52.24.98 with SMTP id t2mr1423804vdf.69.1361526767348; Fri,
	22 Feb 2013 01:52:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.85.36 with HTTP; Fri, 22 Feb 2013 01:52:25 -0800 (PST)
In-Reply-To: <51271A2A.6070604@topic.nl>
References: <cover.1361464203.git.sgw@linux.intel.com>
	<CAJTo0LbDEX1evEJHX9_dfB2+wEK_wYTB6kJd1iwxbXivmwtY0w@mail.gmail.com>
	<51271A2A.6070604@topic.nl>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 22 Feb 2013 09:52:25 +0000
Message-ID: <CAJTo0LaWCAtjiQWq5=FUWq68ty+O2fPYJ8DLLPT-35zqwWn6eg@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
X-Gm-Message-State: ALoCoQlcxTlNZzWlLRvVLGMfwnvpTmdOVw7Hhr9GL6PrWrBJmjmCUStPmRWB4JaRwti0WMz4xf5v
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/41] Selected Updates and fixes
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
X-List-Received-Date: Fri, 22 Feb 2013 10:09:07 -0000
Content-Type: text/plain; charset=UTF-8

On 22 February 2013 07:11, Mike Looijmans <mike.looijmans@topic.nl> wrote:
> If there's anything I can do to help let me know. Is this now blocking the
> integration?
>
> I haven't found any issues with the dependencies, but I've only tested with
> the util-linux-mount/umount pacakges, and the sfdisk package (which does not
> depend on libmount).

Can you verify that util-linux-fsck is no longer depending on
util-linux with this patch?  Maybe I've got a confused build area.

Ross


