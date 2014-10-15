Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f173.google.com (mail-qc0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 8AFE560DD7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Oct 2014 15:32:15 +0000 (UTC)
Received: by mail-qc0-f173.google.com with SMTP id w7so1154440qcr.18
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Oct 2014 08:32:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=p41qwdsKouVbnDygjmjxMh/7FaEjYzZ2EVmEiTb4GwM=;
	b=C/i2t+Xhz/axGbYpOmImbsIbk5xZVweR5MfTyPlEYC4ZQyOc8RcYnWoZU1rMY/nSWX
	gNQlBq0yOMYYwUUTG8TnW3W9aBDmDtWuTMpZupui6qE4P4QmEms2nCVeg3gB3LNy9zcW
	+wmepi4HLf+wPUGhyCzYmLlZbSDFNtIkdQQ7yweDdKmkUAw+L9YCmzD4XXOFHp2LG4uI
	Qxpl9VepBtat8EuxMPapsM8pOwNfFYF0wh+MfastAk0CLTGdkhAG8vwjOHvwNV7AUmMB
	3qaP73y/sTLQSpriE6M82HnSc5fIx6/l9/mVLCf+ACHwVhJqQTGAHYQASdnrzXxbuyda
	heWw==
X-Gm-Message-State: ALoCoQnqJOz8W914C0+Iru+b1SQ9N8ZU2j+/PNgeQSng16EA+jpmzmJtitWDW/0A7qZcGtUva+ts
X-Received: by 10.229.37.138 with SMTP id x10mr21843593qcd.5.1413387135652;
	Wed, 15 Oct 2014 08:32:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.93.65 with HTTP; Wed, 15 Oct 2014 08:31:55 -0700 (PDT)
In-Reply-To: <CAJTo0La=7QNS53qZDgShj+9yr6Ge0hyk9HFAdS+Ue0bZAkck4A@mail.gmail.com>
References: <3230301C09DEF9499B442BBE162C5E482576880D@SESTOEX04.enea.se>
	<CAJTo0La=7QNS53qZDgShj+9yr6Ge0hyk9HFAdS+Ue0bZAkck4A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 15 Oct 2014 16:31:55 +0100
Message-ID: <CAJTo0La9iMQ4ZiSuTFo35271c2McpzkSvugOEqL6dBNoncdkZQ@mail.gmail.com>
To: Sona Sarmadi <sona.sarmadi@enea.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Truly scary SSL 3.0 vuln to be revealed soon:
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Oct 2014 15:32:15 -0000
Content-Type: text/plain; charset=UTF-8

On 15 October 2014 11:07, Burton, Ross <ross.burton@intel.com> wrote:
> Presumably the list of affected packages is:
> - gnutls
> - openssl
> - nss

There's a openssl 1.0.1j out now (fixing FOUR (!) CVEs, including
"disabling SSLv3 didn't work"...).  I think considering the situation
we'd take the upgrade for dizzy, even though we've frozen.  Anyone
volunteering to take lead of upgrading dizzy to 1.0.1j and backporting
the relevant patches to the previous releases? (eg daisy is on
1.0.1g).

Ross

