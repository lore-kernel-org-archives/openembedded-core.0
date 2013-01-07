Received: from mail-vb0-f44.google.com ([209.85.212.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TsBmo-0001kU-9Y
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 13:26:38 +0100
Received: by mail-vb0-f44.google.com with SMTP id fc26so19174298vbb.17
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2013 04:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=0lTzX2wsr8iTtf7UIMAZoEhSCLEg1gFJvpg4MGUpBkY=;
	b=G2wbi4cSrXhTP2TTaT0Pa97A/edN6CCTp0xQqLX1x2tlLhqCzDWV6MVTPEwGbhnuIc
	4jv53wBlL3wrx+wq7fZOK2Zi64dDUF9StI6o1gtXotV0hhbNSQOsozfFlvEyy5Q10fbx
	XrqGODq4Pb+YSoJgnImMLNijLmVZABxRWbLpw6/wTzaLYM/ChIaznsSAGF1KySuvA1I8
	1Po2d+T+Ym8p7XVdRjnHoPqVVqrEh+ce7G2gIea7VQTBKbfwoNw9x6MIWl/CqoAGKrYw
	/SmyFLc4R55jUnB/9/Aqf/xHJZhxiuzmgwufVGp/4cWXT2UO334EAuxflmUuu2bVKlaD
	zv8w==
MIME-Version: 1.0
Received: by 10.220.228.138 with SMTP id je10mr40676664vcb.67.1357560688845;
	Mon, 07 Jan 2013 04:11:28 -0800 (PST)
Received: by 10.58.80.2 with HTTP; Mon, 7 Jan 2013 04:11:28 -0800 (PST)
In-Reply-To: <1357559941.25855.7.camel@ted>
References: <1357516181-5358-1-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-2-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-3-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-4-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-5-git-send-email-cazfi74@gmail.com>
	<1357559941.25855.7.camel@ted>
Date: Mon, 7 Jan 2013 14:11:28 +0200
Message-ID: <CAF6bG8eMo0c=e8G2zd_Y4ST0hG-S2Zx4f4f7hhO8PPML7Ozs7Q@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 04/15] file: replace obsolete automake macros with working ones
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
X-List-Received-Date: Mon, 07 Jan 2013 12:26:39 -0000
Content-Type: text/plain; charset=UTF-8

On 7 January 2013 13:59, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2013-01-07 at 01:49 +0200, Marko Lindqvist wrote:
>> Add obsolete-automake-macros.patch that replaces automake macros
>> no longer supported by automake-1.13 with modern constructs.
>>
>> Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
>> ---
>>  .../file/file/obsolete_automake_macros.patch            |   15 +++++++++++++++
>>  meta/recipes-devtools/file/file_5.11.bb                 |    3 ++-
>>  2 files changed, 17 insertions(+), 1 deletion(-)
>>  create mode 100644 meta/recipes-devtools/file/file/obsolete_automake_macros.patch
>>
>> diff --git a/meta/recipes-devtools/file/file/obsolete_automake_macros.patch b/meta/recipes-devtools/file/file/obsolete_automake_macros.patch
>> new file mode 100644
>> index 0000000..8b0d34c
>> --- /dev/null
>> +++ b/meta/recipes-devtools/file/file/obsolete_automake_macros.patch
>> @@ -0,0 +1,15 @@
>> +Upstream-Status: Fixed in file-5.12
>
> Can we use a standard syntax for this, something like:
>
> Upstream-Status: Backport (fixed in file-5.12)
>
> (as mentioned in
> https://wiki.yoctoproject.org/wiki/Contribution_Guidelines#Patch_Header_Recommendations)

  What's the correct status for fixes that are not really backports,
but have happened independently in oe and upstream?
 - If practically identical, still mark as "Backport"?
 - If different solution, "Inappropriate [not needed]"?


 - ML


