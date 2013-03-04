Received: from mail-ve0-f181.google.com ([209.85.128.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UCUHp-0004gv-GX
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Mar 2013 13:14:34 +0100
Received: by mail-ve0-f181.google.com with SMTP id d10so4509865vea.26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2013 03:58:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=9Rh7ziNwUOnFdnIdM/h4e0BdlPkqtjh4U1dfbBmbzAU=;
	b=Vz+IONQ89XL9hCBuBib18dzFpve1dGZU0P6ebqt3k5LGdyZmMG2Ue5VSJOCQLJBLSk
	YkhokiAJ26JNZS5XiQpNVCqZrG+MbWu9JGCUEP7lJpexxRPXcRcEDJVJ4o9QLf4Mcpkf
	c+9XEfSr3mb14jFEiQxL/qmZrMQlau6lRIcU5d5X4pNgQJmHDM6IQDYE4kKLADtDBRPE
	QU8CihFxovLr1irt8kUjV2nH4eUMVmDNiOVnYahjfvT23530phTJKh9VMZOHg5KJyT1A
	ZsvC2cDw62+t5ujqVpltJv5N8uw/Or96118kipBLMEliG5j0q5gRd+njLIf6w1FscVQo
	Hnlg==
X-Received: by 10.58.90.66 with SMTP id bu2mr1920017veb.29.1362398285490; Mon,
	04 Mar 2013 03:58:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.219.195 with HTTP; Mon, 4 Mar 2013 03:57:44 -0800 (PST)
In-Reply-To: <51325221.5050802@linux.intel.com>
References: <1361273568-30066-1-git-send-email-andrei.adrianx.dinu@intel.com>
	<51325221.5050802@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 4 Mar 2013 11:57:44 +0000
Message-ID: <CAJTo0LZFdOs8N6QDsW6LON3gwm-KgB9Dc7QEaW8HQPdynSAKyA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQl37BTSq8l7EhRFG3GUtcC+9xGlpSUzw0n7ysCbVE3pVhSTGGVhV5rMQX1Akh1dmmr8hhbk
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libpng : update to 1.60.0
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
X-List-Received-Date: Mon, 04 Mar 2013 12:14:34 -0000
Content-Type: text/plain; charset=UTF-8

On 2 March 2013 19:25, Saul Wold <sgw@linux.intel.com> wrote:
> This is because many packages encode the libpng15 information into libtool
> (.la) files, when the sysroot is populated with an older build or sstate
> cache, the libpng15 info remains.

Sounds like another good reason to erase ${libdir}/*.la automatically...

Ross


