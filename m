Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TBWBg-0001nO-MS
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 21:31:56 +0200
Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 11 Sep 2012 12:19:26 -0700
Received: by pbcwy7 with SMTP id wy7so1154217pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 12:19:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=++ywHszvEzvJw+N5gpDhi3DuPx9AweN+Ld4bZlLFkrw=;
	b=oIoO2sHNah1QwKLyyAgyEQHR6ofrSHm2qCd3doDUQSsOTcFBFnE64S9KAysIy2AU7O
	4VVRiLGlHZXibNHarcTB+0zx5UisVM3fOolSxIVyUsWhHgZn7aCeuyEKUPp0c1Iy1Co0
	HYM3/iCiK+oq5FCZz5ZSR7JsJo5iRXL5z4t6YHj8oxu6NKgQS1gwSnzTPT05DBrR5xJY
	v7ZtM2wS9QF50F6YMqL/bq6tn7EDjR4KU/jPXCocIVopjvG55KBpSf7Njobg6IqhIkMS
	+u6klQUwH7I84+Fp1vwAOxeekDgv+dj0Jy00dOLT33KTeKRMu5VJ8GgPNi/KwHf+eNJz
	LocQ==
Received: by 10.68.217.69 with SMTP id ow5mr12372465pbc.35.1347391162569;
	Tue, 11 Sep 2012 12:19:22 -0700 (PDT)
Received: from [10.32.68.88] (72-254-23-251.client.stsn.net. [72.254.23.251])
	by mx.google.com with ESMTPS id
	rz10sm10184365pbc.32.2012.09.11.12.19.17
	(version=SSLv3 cipher=OTHER); Tue, 11 Sep 2012 12:19:18 -0700 (PDT)
Message-ID: <504F8EB5.30503@intel.com>
Date: Tue, 11 Sep 2012 12:19:17 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <504F8D62.8010508@intel.com>
	<CAJTo0LYf2C0PmrpMf3-RsUub1pQmN=G3f6Tt8ou6UNJ-8NoJKA@mail.gmail.com>
In-Reply-To: <CAJTo0LYf2C0PmrpMf3-RsUub1pQmN=G3f6Tt8ou6UNJ-8NoJKA@mail.gmail.com>
X-Gm-Message-State: ALoCoQmdatEK06dTpI9Y7SklyPwHJQDEjRfl3xOrDlqZpqM9EaIrbakuJO97UiUm3VqXJFyOKfaS
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Sato virtual keyboard - how to close it?
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
X-List-Received-Date: Tue, 11 Sep 2012 19:31:57 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/11/2012 12:16 PM, Burton, Ross wrote:
> On 11 September 2012 20:13, Scott Garman <scott.a.garman@intel.com> wrote:
>> In the Sato desktop, there is a virtual keyboard which you can bring up to
>> enter text from a touchscreen interface. Once that keyboard pops up, how do
>> you close it? I'm not seeing anything obvious.
>>
>> I'm helping out with a demo at a conference and could use this info
>> urgently.
>
> Moving the focus from a text field will do it.  I thought there was a
> keyboard icon on the panel which should explicitly hide it, but maybe
> not.

Negatory on both counts. Sounds like a bug?

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


