Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TsAHM-000497-1p
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 11:50:04 +0100
Received: from mail-gg0-f198.google.com ([209.85.161.198])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 07 Jan 2013 02:34:50 -0800
Received: by mail-gg0-f198.google.com with SMTP id f4so29316903ggn.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2013 02:34:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=pyOl58K3xZ/twnoLKV2C+6L3T1N6lIHn6ZQ/IBeeqeg=;
	b=bpx2s2iDsmRBP5aOYRxe5z+XWLyAmOcnotT0ESlp1p6TBE7eCgY9GzdeYwYbVqH7NO
	474hQ+Rv1ZB7oTU6f8PbYm+RaaK8dq/08IqIm+YDDjOiFrwZPOOBsdwHx//MQ9XdbDBK
	vLnU9YSvbPSwl3fpa2fGzYkcRvcffNxtwt5Uvfubw8XeAJ5FQaBvYwTcfaPH2YLQwgd4
	X5FIf7UKax8J7Fekf/n/mDQI9La7yIU5Z1BCQMrxjG21e5b8DME75aOOJpLotQf3BjIa
	Yy5N+fx0zOj5Kr39hdpdx1q8zxusChLbbS7ZvwrL/ucMZVQQV4TXvI/N0qCa7tQ9rwey
	ayyQ==
X-Received: by 10.220.247.136 with SMTP id mc8mr4169150vcb.44.1357554888817;
	Mon, 07 Jan 2013 02:34:48 -0800 (PST)
Received: by 10.220.247.136 with SMTP id mc8mr4169146vcb.44.1357554888743;
	Mon, 07 Jan 2013 02:34:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.103 with HTTP; Mon, 7 Jan 2013 02:34:28 -0800 (PST)
In-Reply-To: <1357550432-9072-1-git-send-email-constantinx.musca@intel.com>
References: <1357550432-9072-1-git-send-email-constantinx.musca@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 7 Jan 2013 10:34:28 +0000
Message-ID: <CAJTo0LZRPidifkOfXo6PB4ywRbjUg=ze8VEwj9Tjyi29fOnfcQ@mail.gmail.com>
To: Constantin Musca <constantinx.musca@intel.com>
X-Gm-Message-State: ALoCoQnGEJziT73ayf2n8gN/QhRmrqMonFa79DTlllQpCoE9YAsvvWtgEifygmFhWpPfxGnyUCn5aDRDcBHa5r3DAh+/0ZW4xGbirdgA5b59jsZFNg5d5rKEA9y/jr7B5G2Y4sEBounyouBClnfN3GqnRUy+kRxP/Y9Ln01V0ZlauqjCKsSO6+4OaUifRtDboiB15c+Vd1o3
Cc: OE-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libgdata: remove recipe
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
X-List-Received-Date: Mon, 07 Jan 2013 10:50:04 -0000
Content-Type: text/plain; charset=UTF-8

On 7 January 2013 09:20, Constantin Musca <constantinx.musca@intel.com> wrote:
> Part of the sato trimming process
>
> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>

Context: nothing in oe-core uses this anymore.  This should be moved
to meta-oe (meta-gnome, I expect) to stop that breaking.

Ross


