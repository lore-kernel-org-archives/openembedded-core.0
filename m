Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Ti6T6-00042y-A6
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Dec 2012 17:44:38 +0100
Received: from mail-oa0-f69.google.com ([209.85.219.69])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 10 Dec 2012 08:30:01 -0800
Received: by mail-oa0-f69.google.com with SMTP id j6so14438890oag.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Dec 2012 08:30:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=z49slbqkC+haO13CquEaQK7VNMnBlANeQNTSWt7PC6U=;
	b=neTgykH3DdZ5U/vmbX0T9TI9feUrZozRqR6dy71t2o0YAgHh0b4+aW22ExSfUsagS8
	E+1fgPHGFQREs+D0OMJIULDbhioaDzTB2pQUb0pBdEv2gLjQ1vY9ubhtH9plo1p3BnUV
	jseSyT4TJQ12ZeKEF3LAGWx0IfRLpY0v6ku3axyCBXv3JJwoTh5fMtWvCT0eNFgeoaoZ
	+4RtFidOp47Vh+tR5KB5idAWCPuM1eSU+72sW/XAehnJKtorC4OLbUYmMRjvK6JKG0kM
	0zSk24xrWwGFLrL27UMndH8Pun1LByGW12MQI+9GGIBOd6uOrEGM0840zYYyqjiWkpb6
	Jdnw==
Received: by 10.182.48.69 with SMTP id j5mr7614832obn.17.1355157000520;
	Mon, 10 Dec 2012 08:30:00 -0800 (PST)
Received: by 10.182.48.69 with SMTP id j5mr7614828obn.17.1355157000440; Mon,
	10 Dec 2012 08:30:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Mon, 10 Dec 2012 08:29:40 -0800 (PST)
In-Reply-To: <20121210142435.29c6a1db@eb-e6520>
References: <1351065917-14779-1-git-send-email-schnitzeltony@googlemail.com>
	<1351065917-14779-4-git-send-email-schnitzeltony@googlemail.com>
	<20121210142435.29c6a1db@eb-e6520>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 10 Dec 2012 16:29:40 +0000
Message-ID: <CAJTo0LZKTGxpDLyG2yRESATjhwCkHMMa4TFSFPC_VVaPy2pePg@mail.gmail.com>
To: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
X-Gm-Message-State: ALoCoQmbFPZTokNnsQFKUVedTVn+q6ICkVjyfghjE5kz4+Yb4vzFl3jvIWg8UPHjrDXA0+grPLtAYoC3+WHp/8/m8FGdz6mpf6dN2nbgbKoKXuSot+CtYfB37E4TKaDb3DORV75xvAPCe72aqU32XILiMqe+JXRHqtAjXljPGwos11fekDWzbzv1lHsWYzsX6IVdG14vkxoy
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [V3 3/4] sato-icon-theme: fix build
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
X-List-Received-Date: Mon, 10 Dec 2012 16:44:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 10 December 2012 13:24, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> is it possible to get this patch into danny ?
> commit ID : 61233b05ad299a34b5d3c06fe3c0162cba8fb273

Two requests on the same day, sure.  Merged to danny-next.

There'll be a danny-next run tonight, if it's green then I'll submit a
merge to danny tomorrow.

Ross


