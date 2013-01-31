Received: from mail-oa0-f48.google.com ([209.85.219.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U0tKd-0003G6-Dy
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Jan 2013 13:33:35 +0100
Received: by mail-oa0-f48.google.com with SMTP id j1so1628673oag.21
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2013 04:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=fgfOfJyNG4hzeBmijPVVNChWHMjEf3h6HLe0MeCLzIw=;
	b=EbU6kVrqiQx8JTGxkJTGJAnVAunSA6bYtps8Jo/FBsR3A6vdj8n4E6pkawg7rIPZc4
	Q6KZjj9N0GjXLyBgBKmlIhjjqVEa9qnPLBQP5YGrE0E7fwgQuDSw6NG0JchYj5SpDfZx
	Ck9ow3cNaUKtLLWf8MSyYDZgrWsALjb887ADdFKCpB9ZxUa+aKDSuJzVz5/I57khow9y
	X5aIcNQPpN6JIwrtUtjZLTr47nrsexWKS+Ys6BwBskZ+bETM/7uQQBY3WmD6EtuxFNzk
	cUCepTIeWgTPhOHMwtYDtVfTdE/eTRWFI2CJSlid/j/PKsWu35JkahdYf3CurxwmpiDM
	/Czw==
MIME-Version: 1.0
X-Received: by 10.60.169.135 with SMTP id ae7mr6261314oec.82.1359634667862;
	Thu, 31 Jan 2013 04:17:47 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Thu, 31 Jan 2013 04:17:47 -0800 (PST)
In-Reply-To: <CAJTo0LYRX_JhqWvHGj+g-qstR_t-LX0hgNM6GNusQ0SddZsi0w@mail.gmail.com>
References: <1359460667-26291-1-git-send-email-otavio@ossystems.com.br>
	<CAJTo0LYRX_JhqWvHGj+g-qstR_t-LX0hgNM6GNusQ0SddZsi0w@mail.gmail.com>
Date: Thu, 31 Jan 2013 10:17:47 -0200
X-Google-Sender-Auth: J8gR9uuPxF3SyxTX0C_z7j6m2Kg
Message-ID: <CAP9ODKowgoFBw4x6MsgjcF7keXKfKHPmhH9sF2mzeUdE=DCX4g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 31 Jan 2013 12:33:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jan 30, 2013 at 2:13 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 29 January 2013 11:57, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> There're some processors which provide binary blobs for DRI and GPU
>> support which need to be build in BSP; to avoid some dirt and ugly
>> hacks in BSP we ought to be flexible.
>>
>> We splitted the glx and dri PACKAGECONFIG options and added a
>> virtual/dri provider so BSP can override it, if need.
>
> Acked-by: Ross Burton <ross.burton@intel.com>

Please hold this patchset. I am checking if it will really attend our need.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


