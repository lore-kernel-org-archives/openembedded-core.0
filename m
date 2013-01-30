Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U0aXL-0002TQ-4P
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Jan 2013 17:29:23 +0100
Received: from mail-vc0-f197.google.com ([209.85.220.197])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 30 Jan 2013 08:13:40 -0800
Received: by mail-vc0-f197.google.com with SMTP id gb30so2200086vcb.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2013 08:13:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=gkE+CdZ/kU8KcB7si0/nTeCt0KEVtm7SR+VAFNxYp1A=;
	b=VfzvHYptTVpo6PR66XWsJfNJ7aRQVjveDRm7ADqXjfRHwoHHE/pY+Y10IafSFIgyX4
	tW+ZeNlC7K6gzwn5BcJkZL0D7elgd6ac82qTPYngklrC6Jag+xUiqHBlZx6DG/yO5ttm
	mYFWvhp/Ih/SWGDcu6ujFzohew54V0L6Ju3IUMGclfV3jDH7TNbHbAR9LLJYxrUs/rbk
	ngUpswcc9zdgt+En3hzfJsOwTUs7T/r/Kv+ug9/2hi+gu2fqnaPc6qcgf7fyTcIYjjiB
	WlZOxPZhi0HVFkMvv0x3imNRBarz00A9E/kqUkOdQ0j1DAmZM0zEl7fGcfjUQxBqW/XQ
	us+Q==
X-Received: by 10.220.228.138 with SMTP id je10mr5161544vcb.67.1359562419328; 
	Wed, 30 Jan 2013 08:13:39 -0800 (PST)
X-Received: by 10.220.228.138 with SMTP id je10mr5161519vcb.67.1359562418886; 
	Wed, 30 Jan 2013 08:13:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.205.236 with HTTP; Wed, 30 Jan 2013 08:13:18 -0800 (PST)
In-Reply-To: <1359460667-26291-1-git-send-email-otavio@ossystems.com.br>
References: <1359460667-26291-1-git-send-email-otavio@ossystems.com.br>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 30 Jan 2013 16:13:18 +0000
Message-ID: <CAJTo0LYRX_JhqWvHGj+g-qstR_t-LX0hgNM6GNusQ0SddZsi0w@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Gm-Message-State: ALoCoQlqvZvuUG1BYJbfIUwAbsMF7pZnNp8LtmlBJAXqD0PqcDgWNCozdmpgwNM6hlSjPY+F2lcv3wlre15ZaHFYJChHSA/f/ABapt2MkwFPm7Yhm6VMRaZfi3I9Q0Rlr9ZmC1MIA08dXMoIxYnt00iUrW+gg32cRu5GXQCWdJdcVAybu0sFyAsL/eFBloMkgNc9iThnR1A+
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 0/3] Improve DRI handling support flexibility
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
X-List-Received-Date: Wed, 30 Jan 2013 16:29:23 -0000
Content-Type: text/plain; charset=UTF-8

On 29 January 2013 11:57, Otavio Salvador <otavio@ossystems.com.br> wrote:
> There're some processors which provide binary blobs for DRI and GPU
> support which need to be build in BSP; to avoid some dirt and ugly
> hacks in BSP we ought to be flexible.
>
> We splitted the glx and dri PACKAGECONFIG options and added a
> virtual/dri provider so BSP can override it, if need.

Acked-by: Ross Burton <ross.burton@intel.com>

Ross


