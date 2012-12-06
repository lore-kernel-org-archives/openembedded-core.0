Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TgbJT-0008QG-0U
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 14:16:27 +0100
Received: from mail-ob0-f197.google.com ([209.85.214.197])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 06 Dec 2012 05:01:59 -0800
Received: by mail-ob0-f197.google.com with SMTP id v19so27988356obq.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Dec 2012 05:01:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=a3Xd1uixn3mMkxyy41WVg8E6lnXhU1nf7Xa0KV+1xp4=;
	b=UEpRtOkw46BFMdADVsO/bGmFpB7eWtbDMMCC0J478weNnbFxAco1ump7q85z8EW5BP
	BguIiHDWhCAmm0XUWeG1ubumIqbeds8zoDxZRWMtTfRDM8Rr/IqMDZLzU5A9qiAtMBfv
	Rk9cV4GwM/NSFkHAklHY2daZvCLuRtzANZ/hPo7PO51b7wwRPVmv/G3D6FjPQXvFrfwi
	Q+fHx3xVmlPvLV25n8zSVnqdzOQ3keRgJH/bMh1ckmdUqjtdFNmcuj3jbPhYeGsVu3Op
	mhbRSyyjjB6NzI036LZ4msRSQxzSWwPoEL8FgA2fAqpJMUOtPDBBAD2pjlyXZaM9MYF9
	GklQ==
Received: by 10.60.169.171 with SMTP id af11mr723199oec.92.1354798918969;
	Thu, 06 Dec 2012 05:01:58 -0800 (PST)
Received: by 10.60.169.171 with SMTP id af11mr723192oec.92.1354798918896; Thu,
	06 Dec 2012 05:01:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Thu, 6 Dec 2012 05:01:38 -0800 (PST)
In-Reply-To: <1354249830-25918-1-git-send-email-yanjun.zhu@windriver.com>
References: <1354249830-25918-1-git-send-email-yanjun.zhu@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 6 Dec 2012 13:01:38 +0000
Message-ID: <CAJTo0Labvea6yuAHpHQbHDrnTgB7N8-hxAno4gHBZCADVxCMnQ@mail.gmail.com>
To: "yanjun.zhu" <yanjun.zhu@windriver.com>
X-Gm-Message-State: ALoCoQnXTMhGW7Uj9R8EvU9sf10ySxa1LEp2A9fEuI3mWoezpowhBt9OgFrvtgNJ1SQ8vjXmQmNDet/xQEZCYH4Qn/zd5oZ4kzY/7vDbt1mlxjTupAp29uEwI3FGI/AlC/UMsgUKZFEc5CPoholCzKtbbKI9C6qr7G7G1Tk66vejbm3wTm2xBvdVi3lDYlFEq4sgEndc49fj
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] Python: Fix for CVE-2012-2135
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
X-List-Received-Date: Thu, 06 Dec 2012 13:16:28 -0000
Content-Type: text/plain; charset=UTF-8

On 30 November 2012 04:30, yanjun.zhu <yanjun.zhu@windriver.com> wrote:
> The utf-16 decoder in Python 3.1 through 3.3 does not update the
> aligned_end variable after calling the unicode_decode_call_errorhandler
> function, which allows remote attackers to obtain sensitive information
> (process memory) or cause a denial of service (memory corruption and crash)
> via unspecified vectors.

The source for the vulnurability says Python 3.1 to 3.3, but you're
patching 2.7.  Is the source not considering the Python 2 releases, or
is 2.7 safe from the exploit?

Ross


