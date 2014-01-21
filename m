Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 745506157A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 12:17:26 +0000 (UTC)
Received: by mail-lb0-f179.google.com with SMTP id l4so4296984lbv.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 04:17:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=K5HC3gB0kt0FmBxHTA4b/fH4FLTc06pn71XhkUyf1Gw=;
	b=PJsKnoN6J5/ZdMSSL5zZfh2qUXgNsazOQ5anEZdSu+mcdCfz+8u3TW68s6aKEltJ5R
	Ery4g9J/Iu5GPkhWCnmnIbxbZxHhjtIK6bUV4k9Od2hYwlwi0CsA6YwVWLPnTZU5/s5H
	xxI9aSJt0A4g8A2RQWaYlI+ZrGdmKQPwgG9Wib6zL8TA+PviTYDv78ItW7I3joe58Diz
	QxvYFcVd6m4ILmkmxaunCOQOkS7+lW8RxpI6xXh3RwutxoDiKuHIZTu5hG/8VqmfhMFi
	T93knxzwnU2m12i2T5bSx7ThUOYyo6C1iYH2bTxbnzlMfiEAePR85H2dJIuX6kbk/G2U
	UgwA==
X-Gm-Message-State: ALoCoQlnkG7NzCNvrPmLp8mA0/6Q8NPpSbIOw5X9o6fetxt6L1v2mOhEdWweqpdje7fZepw0YeO+
MIME-Version: 1.0
X-Received: by 10.112.155.106 with SMTP id vv10mr810600lbb.53.1390306646472;
	Tue, 21 Jan 2014 04:17:26 -0800 (PST)
Received: by 10.112.45.230 with HTTP; Tue, 21 Jan 2014 04:17:26 -0800 (PST)
In-Reply-To: <1390300893.874.79.camel@ted>
References: <1390218017-10423-1-git-send-email-fathi.boudra@linaro.org>
	<1390218017-10423-2-git-send-email-fathi.boudra@linaro.org>
	<1390300893.874.79.camel@ted>
Date: Tue, 21 Jan 2014 14:17:26 +0200
Message-ID: <CAGNsrLBebkDZcLk91x1XPAGW2XzK0opYgRJ7u8s4+Du32t_R9A@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 1/7] ltp: rename recipe to ltp_20140115.bb
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
X-List-Received-Date: Tue, 21 Jan 2014 12:17:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 21 January 2014 12:41, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2014-01-20 at 13:40 +0200, Fathi Boudra wrote:
>> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
>> ---
>>  meta/recipes-extended/ltp/ltp_20130904.bb | 78 -------------------------------
>>  meta/recipes-extended/ltp/ltp_20140115.bb | 78 +++++++++++++++++++++++++++++++
>>  2 files changed, 78 insertions(+), 78 deletions(-)
>>  delete mode 100644 meta/recipes-extended/ltp/ltp_20130904.bb
>>  create mode 100644 meta/recipes-extended/ltp/ltp_20140115.bb
>
> So we rename the recipe but don't actually change the SRCREV to the new
> version (since you do that in 3/7)?
>
> This seems a little confusing?

could be :) I sent the patchset as-is. I can squash the 2 patches if you prefer.

> Cheers,
>
> Richard

