Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f181.google.com (mail-yk0-f181.google.com
	[209.85.160.181])
	by mail.openembedded.org (Postfix) with ESMTP id 4E7646017E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2015 12:17:47 +0000 (UTC)
Received: by ykt10 with SMTP id 10so16418875ykt.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Mar 2015 04:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=8Bz4MbgOEG2JO+rxukNtKHAefWfFV5CH9Xt8c/0iAIg=;
	b=JY1y5o6TtcLbdMkK65s1HX8d5rpHP7vKccZGqda8mdKuFkSDCHqOAhVXklcHIH54+U
	/wrDaODbG0gjn7EWb4HPv2HeUZ9PzGztK8TKhEim3zCjp1ROQl4IjBq24GxHWNTr4Xp3
	QeDoFZ5DW5MmC/NfliEe4xogW0EN8yZm+xozPV2WaYaN8dxDJmlVsJR+e6bwkwa8ilq3
	6t2WWpk/Jm5fSgfVr6OBUzWirU/NlMtKBNx1x2KEsh9H8k+AqqAn+vC9eKe9qdyn6NCc
	ZlZCQy4byaCnCRc0VdjJvIxJf5btbz998/anYoc/xPfwp9xFwnOTlCDKTxtuiGavt3/s
	mDqw==
MIME-Version: 1.0
X-Received: by 10.236.190.5 with SMTP id d5mr29264370yhn.67.1425385069092;
	Tue, 03 Mar 2015 04:17:49 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.133 with HTTP; Tue, 3 Mar 2015 04:17:49 -0800 (PST)
In-Reply-To: <54F59438.1070304@digi.com>
References: <1424177294-41586-1-git-send-email-javier.viguera@digi.com>
	<54ECB8AB.1090709@digi.com> <54F59438.1070304@digi.com>
Date: Tue, 3 Mar 2015 09:17:49 -0300
X-Google-Sender-Auth: Ny0sdIN2C_nNfYOoh-sNSd-shug
Message-ID: <CAP9ODKr3GxPaxtBSPvqQ02DRU8LWP2Ybim7EzJHeFcjPD3NGOA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Javier Viguera <javier.viguera@digi.com>, Saul Wold <saul.wold@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [backport][dizzy][daisy] utils.bbclass: fix create_cmdline_wrapper
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
X-List-Received-Date: Tue, 03 Mar 2015 12:17:48 -0000
Content-Type: text/plain; charset=UTF-8

Hello Javier,

On Tue, Mar 3, 2015 at 8:00 AM, Javier Viguera <javier.viguera@digi.com> wrote:
> On 24/02/15 18:45, Javier Viguera wrote:
>>
>> Hi all,
>>
>> I see this patch was merged into master. Thanks for that.
>>
>> Could it be backported to Daisy and Dizzy?
>>
>> A cherry-pick of the commit in master should apply just fine.
>
>
> Ping.
>
> Master commit: 49ab89eb9f83388e99069a4b53bdc4cba22bb6f3

Adding Saul in Cc.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

