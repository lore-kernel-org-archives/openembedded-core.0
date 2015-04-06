Return-Path: <mario.goulart@gmail.com>
Received: from mail-qc0-f178.google.com (mail-qc0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1F3A1605D2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Apr 2015 12:59:33 +0000 (UTC)
Received: by qcgx3 with SMTP id x3so8049481qcg.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Apr 2015 05:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
	:user-agent:mime-version:content-type;
	bh=XELGne+KYbksGrL9UIj9WzAwRlZMf5BisSztj4VA+0s=;
	b=ffSKkeTDDknAVGyXOaoWTuT5lcs4pIk8W59l05cDr/i4T9P06Ygwbk/j+iWZCALl6C
	G2wrf3a5S95cEVv7AqAdreIRFSqBzB+0B+0OO5hjQXU1jqBdFJk+ql0Bce1A5dxnAoDh
	wX370+hVT8btI7oXwCOlhL4XKB7g1vtUcoLkXJhdX1gxEfmmJlMXjo7Ts3Y4e0Vu5z98
	3jjmAUjoAGoVYQYt8WxuJyfzg4mDTLSrKmJEs2lrxyEbNvDv6iK7JJN8TN5ryFvlvkRU
	qgG4aUR4/QGEGUOakLRDP0CGz4/No0+h+qCGVTy+ZC+BXqF4LlUOYKjHoKqbZnIiAiqX
	4uOg==
X-Received: by 10.55.31.7 with SMTP id f7mr6422304qkf.9.1428325174719;
	Mon, 06 Apr 2015 05:59:34 -0700 (PDT)
Received: from email.parenteses.org.gmail.com (email.parenteses.org.
	[198.199.72.94])
	by mx.google.com with ESMTPSA id r2sm320211qkr.42.2015.04.06.05.59.34
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Apr 2015 05:59:34 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: Mark Hatle <mark.hatle@windriver.com>
References: <87d23uibxw.fsf@email.parenteses.org>
	<CAJTo0LYQXRL85iAGW82nATWdZXiCfhCFqQKKd0tC8DBBZvkJew@mail.gmail.com>
	<87wq1xgk2j.fsf@email.parenteses.org> <551AE604.6090804@windriver.com>
	<87oan8hpp6.fsf@email.parenteses.org> <551B08E6.8040906@windriver.com>
	<87k2xwhoei.fsf@email.parenteses.org> <551B0D16.8000608@windriver.com>
	<87d23ohngp.fsf@email.parenteses.org> <551B15F8.5090300@windriver.com>
Date: Mon, 06 Apr 2015 12:59:31 +0000
In-Reply-To: <551B15F8.5090300@windriver.com> (Mark Hatle's message of "Tue,
	31 Mar 2015 16:47:36 -0500")
Message-ID: <87wq1pe7kc.fsf@email.parenteses.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.4 (gnu/linux)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Ownership issue in package contents
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
X-List-Received-Date: Mon, 06 Apr 2015 12:59:34 -0000
Content-Type: text/plain

Hi Mark and all,

On Tue, 31 Mar 2015 16:47:36 -0500 Mark Hatle <mark.hatle@windriver.com> wrote:

> On 3/31/15 4:21 PM, Mario Domenech Goulart wrote:
>> On Tue, 31 Mar 2015 16:09:42 -0500 Mark Hatle <mark.hatle@windriver.com> wrote:
>> 
>>> On 3/31/15 4:01 PM, Mario Domenech Goulart wrote:
>>>> On Tue, 31 Mar 2015 15:51:50 -0500 Mark Hatle <mark.hatle@windriver.com> wrote:
>>>>
>>>>> On 3/31/15 3:33 PM, Mario Domenech Goulart wrote:
>>>>>>
>>>>>> On Tue, 31 Mar 2015 13:23:00 -0500 Mark Hatle <mark.hatle@windriver.com> wrote:
>>>>>>
>>>>>>> On 3/31/15 12:20 PM, Mario Domenech Goulart wrote:
>>>>>>>>
>>>>>>>> On Tue, 31 Mar 2015 14:50:06 +0100 "Burton, Ross" <ross.burton@intel.com> wrote:
>>>>>>>>
>>>>>>>>> On 27 March 2015 at 17:31, Mario Domenech Goulart <mario@ossystems.com.br> wrote:
>>>>>>>>>
>>>>>>>>>     Note that, although I run "chown -R foo:foo ${D}${libdir}/foo" in
>>>>>>>>>     the recipe, ./usr/lib/foo/ in the package is owned by root.
>>>>>>>>>     However, its content has the right ownership.
>>>>>>>>>
>>>>>>>>> Looks like a bug in pseudo to me, can you file a bug for that?
>>>>>>>>
>>>>>>>> Sure.  Filed #7554.
>>>>>>>
>>>>>>> I'd suggest you look at meta/classes/package.bbclass "fixup_perms" function.
>>>>>>>
>>>>>>> The ${D}${libdir} (and above) are "corrected" to be 'root:root' by this
>>>>>>> function.  I don't know why 'foo' would be, but if it's a standard defined
>>>>>>> variable -- or if 'directory walking' is enabled it could end up doing this as well.
>>>>>>>
>>>>>>> The control file for this is in meta/files/fs-perms.txt (unless otherwise
>>>>>>> defined by a distribution or other configuration file.)
>>>>>>
>>>>>> Thanks a lot.  You seem to have guided me exactly to what causes the
>>>>>> issue.
>>>>>>
>>>>>>>
>>>>>>> Format of the file is:
>>>>>>>
>>>>>>> # The format of this file
>>>>>>> #
>>>>>>> #<path> <mode>  <uid>   <gid>   <walk>  <fmode> <fuid>  <fgid>
>>>>>> ...
>>>>>>>
>>>>>>> The default is:
>>>>>> ...
>>>>>>> libexecdir	0755 root root false - - -
>>>>>> ...
>>>>>>
>>>>>> This variable seems to be the cause of problems:
>>>>>>
>>>>>> $ bitbake -e foo | grep libexecdir=
>>>>>> export libexecdir="/usr/lib/foo"
>>>>>>
>>>>>> As far as I understand, package.bbclass may use a user-configured
>>>>>> permissions table (via FILESYSTEM_PERMS_TABLES), but I'm not sure if
>>>>>> this is the right "fix" for the case in question.  I'd have to hardcode
>>>>>> the owner of /usr/lib/foo to be "foo", but foo may not be available when
>>>>>> packaging other recipes.
>>>>>
>>>>> Ok, good this answers the question as to "why" it's happening.  You can easily
>>>>> fix this by adding a configuration specific fs-perms.txt file (can name it
>>>>> anything) that overrides that setting and add it to the FILESYSTEM_PERMS_TABLES.
>>>>>  You can do this globally in a layer, a distribution or even just a recipe.
>>>>>
>>>>> In your recipe you can likely do something like:
>>>>>
>>>>> FILESYSTEM_PERMS_TABLES ?= "files/fs-perms.txt"
>>>>> FILESYSTEM_PERMS_TABLES += "${THISDIR}/files/recipe-perms.txt"
>>>>>
>>>>> (Do the ?= first in case it's already set by someone else, then add your recipe
>>>>> specific perms later)
>>>>>
>>>>> Contents of the "${THISDIR}/files/recipe-perms.txt":
>>>>>
>>>>> ${libexecdir} 0755 myuid mygid true - myuid mygid
>>>>>
>>>>> Then you can even skip the chown -R, as the system will do it for you.
>>>>
>>>> I actually had tried that, but I got errors -- probably because the
>>>> ownership will be set for each package that installs ${libexecdir}, and
>>>> which is processed before the recipe that actually creates the
>>>> user/group specified for ${libexecdir} in the file pointed by
>>>> FILESYSTEM_PERMS_TABLES.
>>>
>>> This is a bug then.  The owner/group correction is supposed to be made AFTER the
>>> user/groups have been added to the system (sysroot) via the adduser.  THAT is a
>>> bug that IMHO should be fixed sooner, rather then later.
>>>
>>> It might be as simple as the install sysroot (${D}) configuration with pseudo
>>> isn't pointing to the right /etc/passwd and /etc/group.  I believe it should be
>>> pointing to the one in the regular sysroot repository.
>> 
>> I should also have mentioned that initially I set
>> FILESYSTEM_PERMS_TABLES globally.
>> 
>> Now I set it in the foo recipe, but still get errors:
>> 
>> ----------------------------8<---------------------------------
>> ERROR: Error executing a python function in .../foo.bb:
>> 
>> The stack trace of python calls that resulted in this exception/failure was:
>> File: 'fixup_perms', lineno: 231, function: <module>
>>      0227:                    each_file = os.path.join(root, f)
>>      0228:                    fix_perms(each_file, fs_perms_table[dir].fmode, fs_perms_table[dir].fuid, fs_perms_table[dir].fgid, dir)
>>      0229:
>>      0230:
>>  *** 0231:fixup_perms(d)
>>      0232:
>> File: 'fixup_perms', lineno: 173, function: fixup_perms
>>      0169:                if len(lsplit) != 8 and not (len(lsplit) == 3 and lsplit[1].lower() == "link"):
>>      0170:                    msg = "Fixup perms: %s invalid line: %s" % (conf, line)
>>      0171:                    package_qa_handle_error("perm-line", msg, d)
>>      0172:                    continue
>>  *** 0173:                entry = fs_perms_entry(d.expand(line))
>>      0174:                if entry and entry.path:
>>      0175:                    fs_perms_table[entry.path] = entry
>>      0176:            f.close()
>>      0177:
>> File: 'fixup_perms', lineno: 32, function: __init__
>>   File "fixup_perms", line 32, in __init__
>> 
>> File: 'fixup_perms', lineno: 43, function: _setdir
>>   File "fixup_perms", line 43, in _setdir
>> 
>> File: 'fixup_perms', lineno: 67, function: _procuid
>>   File "fixup_perms", line 67, in _procuid
>> 
>> Exception: KeyError: 'getpwnam(): name not found: foo'
>> ---------------------------->8---------------------------------
>> 
>> I still have the chown line in do_install, and that seems to "work"
>> (i.e., it doesn't cause errors).  The error above seems be caused by
>> something in do_package (fix_perms, specifically) that is not using the
>> proper authentication database.
>
> What is odd, if it's working in do_install, then it should be working in the
> package set.
>
> You should probably look at dumping the value of PSEUDO_PASSWD in the do_install
> step, and then later in the package.bbclass when it fails.  If it fails we can
> compare the values and see what the mismatch might be.
>
> It would be good if you could dump the environment at this point and see where
> the password/group file are being sourced from.
>
> Try something like:
>
>                     package_qa_handle_error("perm-line", msg, d)
>                     continue
> +               try:
> +                   entry = fs_perms_entry(d.expand(line))
> +               except:
> +                   bb.error("debug: PSEUDO_PASSWD = '%s'" %
> os.getenv("PSEUDO_PASSWD"))
> +                   raise
>                if entry and entry.path:
>                     fs_perms_table[entry.path] = entry
>
> The code will still "crash", but should print out the value of PSEUDO_PASSWD
> first.  I would expect that PSEUDO_PASSWD would be pointing into the
> tmp/sysroot/<machine> directory.

Thanks for all the hints and for your patience.

It looks like I was caught by a messed up TMPDIR.  After I removed
TMPDIR and baked the foo recipe, everything works.  I could make it work
by adding

  FILESYSTEM_PERMS_TABLES = "files/fs-perms.txt ${THISDIR}/${PN}/fs-perms-foo.txt"

to the foo.bb recipe.  In this case files/fs-perms.txt is the global
default one and ${THISDIR}/${PN}/fs-perms-foo.txt is the foo-specific
one that has one line only, which sets the permissions for
${libexecdir}.

I had to explicitly prepend files/fs-perms.txt because packages.bbclass
would not pick files/fs-perms.txt if FILESYSTEM_PERMS_TABLES is set.

Best wishes.
Mario
-- 
http://www.ossystems.com.br

