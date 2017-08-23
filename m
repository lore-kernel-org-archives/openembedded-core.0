Return-Path: <kristian.amlie@northern.tech>
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id A20DE7828E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 13:19:43 +0000 (UTC)
Received: by mail-lf0-f47.google.com with SMTP id d17so471577lfe.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 06:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=northern.tech; s=google;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=oLLyiqPIw6ipcfcuY46LdTf6z1Bxnh4D7xWBgfzbPrg=;
	b=VVzsbuL68ntRP+dnMbF5XKZoSAtQDhkHTtySXOjzkpZlmgmug4O5YjJEOYYAKd+91P
	rYBdTYyu5ZluKPRadTlIo1G3ZJUH/at+4Ef2IT4pEcKKzbsUy4mEOF5NZmtUO++ILOD4
	dciTzsb2Ua1Hw0hh57co9yAfgjSFfCll2O0D9QEWM1woPQ9yZdpU9XabzMP5ZvNcLtIi
	bZ/irHPMLuhGCBsUwMoLi3wQPiB0ddnz7Zru6Z/in99/Kq1mu8sWvueGmRxhA1flFFaX
	/Xk4TFQ0vu79PxDIUzgwTgXe7wjusqNI0qR9hU13X8M7n3TU7wMc+Hbddwpbjs+TyKIH
	BBWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=oLLyiqPIw6ipcfcuY46LdTf6z1Bxnh4D7xWBgfzbPrg=;
	b=LHUHrXbV7mg+hvLDVicTKFi21TV1yHoAd+SxFZSsY6T/tIQiHXSoEpGbgBgLA+O8+A
	i4ANDJsCMkF9vj7ltYp3BEjVcToc0sXqlpSnIM5Xs2efacKNQtbzWWzChTlmqIZcq2cH
	OrgcZ68H7SW/cIq3LHMA+X70a2PBBIcsEMNlUr0x1gHucRlNW+Xm4Ax3qh/xcr20Wkj/
	5jfGBmjSgr/TtOf+Qs6BS9sgaAxqoegWqKpjTbehRwnK532ENRpa58RhS+8hBdWb7M+r
	sggqeZFjB23oTLhCp6Ew89zEAK1ZtSadExE5bULJ3xkic4c5/8yaUfe3tn8KJrbj5OG2
	ulPA==
X-Gm-Message-State: AHYfb5hKGboCSChFn/l8LBftHhzoJKaNACWT45Y6z+8tJWGiNXb21A4K
	bqdFC0WeAWDb8poxxCfruQ==
X-Received: by 10.46.33.196 with SMTP id h65mr1372323lji.82.1503494384317;
	Wed, 23 Aug 2017 06:19:44 -0700 (PDT)
Received: from [10.20.33.249] ([195.159.234.190])
	by smtp.googlemail.com with ESMTPSA id
	t4sm241109lff.96.2017.08.23.06.19.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Aug 2017 06:19:43 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <1503488763-1554-2-git-send-email-kristian.amlie@northern.tech>
	<1503491991-14792-1-git-send-email-kristian.amlie@northern.tech>
	<1503492367.32591.153.camel@linuxfoundation.org>
From: Kristian Amlie <kristian.amlie@northern.tech>
Message-ID: <923ee536-02f8-9e81-b8f3-fa25bb8aba24@northern.tech>
Date: Wed, 23 Aug 2017 15:19:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1503492367.32591.153.camel@linuxfoundation.org>
Subject: Re: do_image: Implement IMAGE_ROOTFS_EXCLUDE_PATH feature.
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
X-List-Received-Date: Wed, 23 Aug 2017 13:19:43 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 23/08/17 14:46, Richard Purdie wrote:
> On Wed, 2017-08-23 at 14:39 +0200, Kristian Amlie wrote:
>> I don't understand why I'm getting patch failures. This is rebased to
>> cutting edge master. Trying one more time...
> 
> Its because you're patching documentation which is maintained in a
> separate repository. Separating that from the patch will avoid that
> error.

Aaah, right, this is from poky. Thanks for explaining, I'll fix that!

-- 
Kristian

