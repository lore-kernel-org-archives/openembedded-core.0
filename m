Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TgHYQ-00008e-D5
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 17:10:34 +0100
Received: from mail-ob0-f197.google.com ([209.85.214.197])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 05 Dec 2012 07:56:08 -0800
Received: by mail-ob0-f197.google.com with SMTP id v19so23308756obq.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Dec 2012 07:56:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=sdZufJ+fpGuft9JnAbJM4jlj6moc6hOwA2fP67Ml2/0=;
	b=nh3nzYzXxLoju69pUajnqX9pklUpt3HetYXecaUsJimqWs6V0SAUz7d5WeDwuiIUB3
	/s3mqy78OU+Hofsjqi4a0TC7CLIIOarFAQI1IY03qYs9dYCh0eybifbsUfnoVvtrF5wP
	3arA9QYq8PQFYSPvBn4LUzUEa7pi21CI3xrkRM0g3oImcyi+nD5fvZLtURySi5JxZoFZ
	pI3wnrfkkJBcEy2YXzAi9YT+8PhYVW2i8nHgHyKHrVE81p2TEVid0LhIbeOQP2507eEz
	QKzmVJP2lOhSGXjAy7vhKN0TT3uiyKdgooPUfVB7LxbErmkiiGPyRV6MnXa+l2lt5SGv
	zmAw==
Received: by 10.182.89.103 with SMTP id bn7mr10831521obb.35.1354722967748;
	Wed, 05 Dec 2012 07:56:07 -0800 (PST)
Received: by 10.182.89.103 with SMTP id bn7mr10831519obb.35.1354722967678;
	Wed, 05 Dec 2012 07:56:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Wed, 5 Dec 2012 07:55:47 -0800 (PST)
In-Reply-To: <CAP9ODKq74Q9pcM_T_-q62H3vWJH_Pk3BSGRbx0=7mf8h9UDGAQ@mail.gmail.com>
References: <1354654683-16793-1-git-send-email-ross.burton@intel.com>
	<CAP9ODKr0TG3LRah3rCjwwUCkka=kHW3Ed4LXNpWA+81Eb2t=GA@mail.gmail.com>
	<CAJTo0LatQogGTmc41DMtyJi3mjtNRqWgX65Xw4AfwNra+37bGw@mail.gmail.com>
	<CAP9ODKq74Q9pcM_T_-q62H3vWJH_Pk3BSGRbx0=7mf8h9UDGAQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 5 Dec 2012 15:55:47 +0000
Message-ID: <CAJTo0Lbn5jWz7SbJ96GrjJsZAwqkN=MWeJCaP_85YifN_PgXRQ@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Gm-Message-State: ALoCoQl38drJ5HWd7Xg800dod5Ita3Wilp+eFyTzFMaF/FQJK9ZZllRi4lHkXSdaPX3rI89Sfvxcd7B0pcyWWZUQ2hKdWlk4Y0ECJ8CoyCgC1VIXx8H9zVHqZEh1sCg7w/oznowIIOlP3EHlcQa+RAhA968y7sSlEHq1bkdOyTbZJR8Tu71kdmJ4klLAjs92vG5K4xW8Nd7R
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gst-meta-base: pull in X11 plugins when using X11
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
X-List-Received-Date: Wed, 05 Dec 2012 16:10:34 -0000
Content-Type: text/plain; charset=UTF-8

On 5 December 2012 15:52, Otavio Salvador <otavio@ossystems.com.br> wrote:
> Just xvimagesink as this is an improvement, not a requirement.

That's an interesting definition of improvement.  Video playback over
X11 without using Xvideo is crazy.

Ross


