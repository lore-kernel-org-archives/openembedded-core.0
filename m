Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f172.google.com (mail-qc0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id A878C6E7E3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 10:02:29 +0000 (UTC)
Received: by mail-qc0-f172.google.com with SMTP id w7so949778qcr.17
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 02:02:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=KX8scaTiqOQ71S8I1gygSWF2nMnkpAQ4q+jka30Q5vo=;
	b=VOWBIpBn2GCZ4vseyVPxPInLh1UqDfXBR0aNx90B70np1qwa22HnOccgDyxeyk5uOh
	2danIdhZ9w0oppzF4dzCRftWKuw/RAlW5lq5sq+PKWg+SlU/IhMX6eZNEnYqH2xS8u31
	dbNegFSjYF1DWg4FLscmDJwf6FQcZ+kBgMKUXnI7Pzwf4xyNI+3Mm25qCxPKhNIG76yE
	HN1Stf24ftxMrIzF8t9HEuZLA52UWASU+eBJqEIpf11zE1qhCIo/g4tWT8njlUE/1J5A
	C6PGveNqkYJkbxtMQVh1nJ1Nljme5XEQsvRc44UTrOK3dYYZ+9iabVPHb7P2kXTBX/8A
	/awA==
X-Gm-Message-State: ALoCoQkSFiiHs73GAePBtr+Pe3SnTBxLekxMiOOzs4lkndgmE9WQF3xPEwfMiXMr9IX3BJ/Sow3Z
X-Received: by 10.224.45.197 with SMTP id g5mr6703600qaf.52.1393408950887;
	Wed, 26 Feb 2014 02:02:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Wed, 26 Feb 2014 02:02:10 -0800 (PST)
In-Reply-To: <daee4480b735a557aaa314f9a1f9bf6fbb3f9a12.1393399942.git.Qi.Chen@windriver.com>
References: <cover.1393399942.git.Qi.Chen@windriver.com>
	<daee4480b735a557aaa314f9a1f9bf6fbb3f9a12.1393399942.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 26 Feb 2014 10:02:10 +0000
Message-ID: <CAJTo0LaOPBcyt-WfvXqKR4FEpVD3Lf5c04BXemFNC6_Pa-JMkQ@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] python-numpy: fix compile error for qemumips
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
X-List-Received-Date: Wed, 26 Feb 2014 10:02:38 -0000
Content-Type: text/plain; charset=UTF-8

On 26 February 2014 07:33, Chen Qi <Qi.Chen@windriver.com> wrote:
> This is because for qemumips, there are no such files in SRC_URI. And
> actually we don't need such files. So for qemumips, the `cp' command
> is expected to fail.

Those files contain the definitions of things like word size and byte
ordering, so unless I've misunderstood the build process for numpy
what's happening with this patch is that it's using the host
environment.

Ross

