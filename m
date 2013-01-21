Received: from mail-ie0-f169.google.com ([209.85.223.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TxMaW-0005Ow-O3
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 19:59:21 +0100
Received: by mail-ie0-f169.google.com with SMTP id c14so10499538ieb.28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 10:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=G+v4Oy6W61xf7b/1t0DoJmSnsgVgS5ukAYwfW1wiuOo=;
	b=WeHqn1GZBh3Z2BT5eVzWqoZxR6IKCQcwvGktGxx3uvjl6xbDbP4bwusimEa4RpfCR8
	pmEAB2Z8TCL8yB5FDRNkoa0vXe9tXbtf13BZqQSedzw2NbrnQ9uvnPYgSiR0O+4ionNI
	s3FfcJh5uqefmbOpS9dQN2bZl2XDLPThBnQCH3VB0Hxrs9PzpCdF3Ix8w+iuvrj9C35W
	kYXGKhu6vkTOzZEP5cq5QtReaNSJhGtS2MsFN0pbvID/T3LszqWOMtPclsS7owI1OMfs
	foyqUUlWa+iPAmi/69GZMKZKw4bn99/2pISLaKPnc7DhDAr5lStxX8+ouKLHDHa8tmJ8
	kuFw==
X-Received: by 10.50.56.232 with SMTP id d8mr9845261igq.112.1358793831336;
	Mon, 21 Jan 2013 10:43:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.18.169 with HTTP; Mon, 21 Jan 2013 10:43:21 -0800 (PST)
In-Reply-To: <50FCBF25.8040905@linux.intel.com>
References: <613da782b369ba5424b5619b4315ea34e645d53c.1358634922.git.raj.khem@gmail.com>
	<45d894b5a00300841877376b868fc820a3070043.1358634922.git.raj.khem@gmail.com>
	<50FCBF25.8040905@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 21 Jan 2013 10:43:21 -0800
Message-ID: <CAMKF1sqcM-XyhGCXRsskAPoiVY1kgAWP997M0+JvX4geGSAouQ@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Khem Raj <kraj@juniper.net>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/4] nfs-utils: Upgrade 1.2.3 -> 1.2.8-rc2
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
X-List-Received-Date: Mon, 21 Jan 2013 18:59:23 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Jan 20, 2013 at 8:08 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 01/19/2013 02:40 PM, Khem Raj wrote:
>>
>> From: Khem Raj <kraj@juniper.net>
>>
>> Disable nfsv4l since it needs LVM2 which
>> is not available in OE-Core
>>
>> Disable nfsdcltrack since its configure time check
>> for sqlite3 is not cross compiling safe
>>
>> It can support ipv6 but thats disabled since
>> we disable libtirpc which is needed for ipv6
>> support in nfs-utils
>>
>> Patches imported from fedora to take us to 1.2.8-rc2
>>
>> Signed-off-by: Khem Raj <kraj@juniper.net>
>> ---
>>   .../nfs-utils/nfs-utils-1.0.6-uclibc.patch         |   37 +-
>>   .../nfs-utils-1.2.1-exp-subtree-warn-off.patch     |   12 +
>>   .../nfs-utils/nfs-utils-1.2.1-statdpath-man.patch  |   58 +++
>>   .../nfs-utils-1.2.3-sm-notify-res_init.patch       |   21 +
>>   .../nfs-utils/nfs-utils-1.2.5-idmap-errmsg.patch   |   12 +
>>   .../nfs-utils/nfs-utils-nfsctl-x32-fix.patch       |   30 --
>>   .../nfs-utils/nfs-utils/nfs-utils.1.2.8.rc2.patch  |  535
>> ++++++++++++++++++++
>>   .../nfs-utils/nfs-utils.1.2.8.rc2.patch.1          |  535
>> ++++++++++++++++++++
>>   .../{nfs-utils_1.2.3.bb => nfs-utils_1.2.7.bb}     |   28 +-
>>   9 files changed, 1210 insertions(+), 58 deletions(-)
>>   create mode 100644
>> meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.1-exp-subtree-warn-off.patch
>>   create mode 100644
>> meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.1-statdpath-man.patch
>>   create mode 100644
>> meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.3-sm-notify-res_init.patch
>>   create mode 100644
>> meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.5-idmap-errmsg.patch
>>   delete mode 100644
>> meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-nfsctl-x32-fix.patch
>>   create mode 100644
>> meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils.1.2.8.rc2.patch
>>   create mode 100644
>> meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils.1.2.8.rc2.patch.1
>>   rename meta/recipes-connectivity/nfs-utils/{nfs-utils_1.2.3.bb =>
>> nfs-utils_1.2.7.bb} (63%)
>>
>
> Some of these patches do not have the proper Signed-off-by: and
> Upstream-Status: tags.
>

Ignore this one, I have since updated to later RC3 and will do cleanups
and resend


