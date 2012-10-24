Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TR2HA-0007oa-9Q
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Oct 2012 16:49:44 +0200
Received: from mail-ie0-f197.google.com ([209.85.223.197])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 24 Oct 2012 07:36:14 -0700
Received: by mail-ie0-f197.google.com with SMTP id 9so1524226iec.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Oct 2012 07:36:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=nkE554+96+4R1joQ4LwAXWgp+Q+FVnRtxGhRnrNzzN4=;
	b=LEkXaOLuYi5j11cUAmHcXeFz1X388Sxh9Nn+KMLizqTTz5SRIiPA6QZVd0eB3sUb1e
	SE7JNlIT7PcJjC8+R8xitGPGG2t7B0/Tt/34IeNQHH+WBYqaDZ6QjsUeQT+oAISv1wSM
	n5IoCtECD/HrZ/w24b430rn3auSmpQjh31EY/KL2qppMFWe7fG1gRFJcmUYIvsTEdJxb
	5lpfY0t35hQiys3GyBRmB0SGhBHe7UppWKWDt/E015b+Ra/L00pBAKvMwRwtr2za4MAC
	BDmtZ+x3OI2y6iuhmvD1DMqwMpell8OWOo9I4hFvRbEkmxqtq7uaxzAlqESSfkVrZial
	OyVQ==
Received: by 10.182.228.69 with SMTP id sg5mr7790741obc.2.1351089373769;
	Wed, 24 Oct 2012 07:36:13 -0700 (PDT)
Received: by 10.182.228.69 with SMTP id sg5mr7790738obc.2.1351089373720; Wed,
	24 Oct 2012 07:36:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.46.70 with HTTP; Wed, 24 Oct 2012 07:35:53 -0700 (PDT)
In-Reply-To: <20121024121629.GE3269@jama.jama.net>
References: <20121024121629.GE3269@jama.jama.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 24 Oct 2012 15:35:53 +0100
Message-ID: <CAJTo0Lb94-kCKVFdZxRwAWdUQSm0yNwLk-MsWR5SFUJwE7MGUg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQnvMmZplKY/Lt//rF4TmUm6dMFJNkHm+NrwZNhSdGB/cxfeA/S1wFi0+VqW4/mhhQTMtDhGUuo9StNP9NOS6E8q+ECWAwZLpo9TjnAV3fqR1k4VLdA8cj/ezQaLRurAG5oxVtcZD21+WtaL4u6QbuNb4sivxpy0VT3rb94LOWE+NQJssRFhXkLfTi9NpOJJHL6/nwJC
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: gconf-native backends broken when reused from sstate?
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
X-List-Received-Date: Wed, 24 Oct 2012 14:49:44 -0000
Content-Type: text/plain; charset=UTF-8

On 24 October 2012 13:16, Martin Jansa <martin.jansa@gmail.com> wrote:
> | /OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/gconftool-2 --makefile-install-rule apps_foxtrotgps.schemas

Yeah, don't do that.  You probably want to inherit gconf in that recipe.

Ross


