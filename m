Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4982060797
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 00:57:57 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id y69so81256469pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 May 2016 17:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=oiOEnZz2OYiN8VgMXL79tqvZoFbofRT0V1dZtc4TJ/I=;
	b=EAg88du+eFrX2mpOw9/qU58/R6FHOnRrahTEHNfAgkoz8XixkGNOI3OvclA8fglYpF
	inXaz/viCru0qxtI0mBiVEbeM9lf0aId0OTDPbgzPRfuKx9XkK4QknxNedEpj15jCdz/
	/vIUa+IOBRPXgy2v25sox8Lj/GNUt/9H7MTLPFhnHe7ZyYWt9/Y58g/SwPej6gpLa77O
	B+qROJgjbyHuBJfaAYKGUyNtXn3+/r5Eiigz2wRi/VgnHZC+p60W2yfTn4ETrgbTEsGS
	NdyyujBM+IYkFPBRTVGe23MOiGJDKnXuHy8ebz8VtTbHwzo4W5Uktlg3cRceN6m2ZcJa
	6XuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=oiOEnZz2OYiN8VgMXL79tqvZoFbofRT0V1dZtc4TJ/I=;
	b=gK/fl5OmOJau5pQpmWPa2OflhPuRIyidRcQMT+ibxb3cW9LhhUUybA1UXYvbUQ/58p
	d5HnkC4FrI0c65zjvvGsxVc2hw2f9RrtLwYeN69r8hV/j775MRIu1N5LeXn+KfkwUy/T
	ngWvGV+8V3yheolcPMw/GmCZOozP+09st+y4l67TeTvbCJHpoGuF2iOQ9LrkkDqcXNfa
	Y7lM5zfL2dHDkhIL9ZvaupA5NDhR+JpSe386CyTEFa+x57NaDEkrv/kbvkQaReOJMtEa
	rM4DwP181t8d8FKtN2F+VW/DgQ4r4guzTsjuY9PAc1mZUlGzuwPRp61/sM+p3SM8gjsA
	K0zQ==
X-Gm-Message-State: AOPr4FVdqZr6NWAWK3fjQZe5i4e9TaRlIMSwlKUw8Ugo7jEpZYCcYoVAdBcKgPE954/2jQ==
X-Received: by 10.98.75.154 with SMTP id d26mr21696743pfj.72.1462841878763;
	Mon, 09 May 2016 17:57:58 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:1462:b3e2:90da:dbff?
	([2601:646:8800:5a9a:1462:b3e2:90da:dbff])
	by smtp.gmail.com with ESMTPSA id
	g84sm43224962pfj.42.2016.05.09.17.57.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 May 2016 17:57:57 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20160510005523.GB31614@smogharr-mobl.amr.corp.intel.com>
Date: Mon, 9 May 2016 17:58:07 -0700
Message-Id: <4D8C4A66-AA6E-4A25-B8F5-804D18C917B7@gmail.com>
References: <1462837346-27095-1-git-send-email-stephano.cetola@linux.intel.com>
	<1462837346-27095-3-git-send-email-stephano.cetola@linux.intel.com>
	<0C224579-B9F0-4EB4-9F25-29CE9C3AD631@gmail.com>
	<20160510005523.GB31614@smogharr-mobl.amr.corp.intel.com>
To: Stephano Cetola <stephano.cetola@linux.intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 2/2] systemd: add users/groups at build rather than runtime
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
X-List-Received-Date: Tue, 10 May 2016 00:57:58 -0000
X-Groupsio-MsgNum: 81784
Content-Type: multipart/signed;
	boundary="Apple-Mail=_73991FC9-BBFE-48D8-A029-DB1642C16058";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_73991FC9-BBFE-48D8-A029-DB1642C16058
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On May 9, 2016, at 5:55 PM, Stephano Cetola =
<stephano.cetola@linux.intel.com> wrote:
>=20
> On 05/09, Khem Raj wrote:
>>=20
>>> On May 9, 2016, at 4:42 PM, Stephano Cetola =
<stephano.cetola@linux.intel.com> wrote:
>>>=20
>>> This fix ensures that systemd users are created at build and that =
any
>>> staticids for the users or groups are preserved. This functionality =
only
>>> existed for readonly filesystems, however it seems wise to be sure =
these
>>> users are added rather than relying on systemd to create them.
>>=20
>> We need to cover the case where online package management is used. If =
you were to fix
>> it in systemd recipe itself which takes care of creating these users =
in post installs
>> that will fix it for this case too.
> I'm not sure I follow you. I can see how this could be done in a post
> install script, but I'm missing how this would help online package
> management. Could you please point me in the right direction?

Lets say, I did not install microhttpserver in default image. But later =
on I decided to install it via
O_P_M feeds. or remove for that matter.

>>=20
>>>=20
>>> [ YOCTO #9497 ]
>>>=20
>>> Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
>>> ---
>>> meta/classes/rootfs-postcommands.bbclass | 66 =
+++++++++++++++++++++-----------
>>> meta/classes/useradd-staticids.bbclass   | 56 =
+--------------------------
>>> useradd-staticids-list.bbclass           | 56 =
+++++++++++++++++++++++++++
>>> 3 files changed, 100 insertions(+), 78 deletions(-)
>>> create mode 100644 useradd-staticids-list.bbclass
>>>=20
>>> diff --git a/meta/classes/rootfs-postcommands.bbclass =
b/meta/classes/rootfs-postcommands.bbclass
>>> index 95d28af..db4cc75 100644
>>> --- a/meta/classes/rootfs-postcommands.bbclass
>>> +++ b/meta/classes/rootfs-postcommands.bbclass
>>> @@ -1,4 +1,4 @@
>>> -
>>> +inherit useradd-staticids-list
>>> # Zap the root password if debug-tweaks feature is not enabled
>>> ROOTFS_POSTPROCESS_COMMAND +=3D =
'${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', =
'empty-root-password' ], "", "zap_empty_root_password ; ",d)}'
>>>=20
>>> @@ -23,6 +23,9 @@ POSTINST_LOGFILE ?=3D =
"${localstatedir}/log/postinstall.log"
>>> SYSTEMD_DEFAULT_TARGET ?=3D '${@bb.utils.contains("IMAGE_FEATURES", =
"x11-base", "graphical.target", "multi-user.target", d)}'
>>> ROOTFS_POSTPROCESS_COMMAND +=3D =
'${@bb.utils.contains("DISTRO_FEATURES", "systemd", =
"set_systemd_default_target; ", "", d)}'
>>>=20
>>> +# Create systemd users at build rather than at runtime
>>> +ROOTFS_POSTPROCESS_COMMAND +=3D =
'${@bb.utils.contains("DISTRO_FEATURES", "systemd", =
"create_systemd_sysusers; ", "", d)}'
>>> +
>>> ROOTFS_POSTPROCESS_COMMAND +=3D 'empty_var_volatile;'
>>>=20
>>> # Disable DNS lookups, the SSH_DISABLE_DNS_LOOKUP can be overridden =
to allow
>>> @@ -30,7 +33,45 @@ ROOTFS_POSTPROCESS_COMMAND +=3D =
'empty_var_volatile;'
>>> SSH_DISABLE_DNS_LOOKUP ?=3D " ssh_disable_dns_lookup ; "
>>> ROOTFS_POSTPROCESS_COMMAND_append_qemuall =3D =
"${SSH_DISABLE_DNS_LOOKUP}"
>>>=20
>>> -
>>> +# Add systemd users checking for any staticids
>>> +python create_systemd_sysusers () {
>>> +    import shlex
>>> +    import subprocess
>>> +    s_users =3D merge_files(get_passwd_list(d), 7)
>>> +    s_groups =3D merge_files(get_group_list(d), 4)
>>> +    confs =3D ['%s/usr/lib/sysusers.d/systemd.conf' % =
d.getVar('IMAGE_ROOTFS', d), '%s/usr/lib/sysusers.d/systemd-remote.conf' =
% d.getVar('IMAGE_ROOTFS', d)]
>>> +    for conf in confs:
>>> +        if os.path.isfile(conf):
>>> +            with open(conf, 'r') as f:
>>> +                for line in f:
>>> +                    if line.startswith('#'):
>>> +                        continue
>>> +                    fields =3D shlex.split(line.rstrip())
>>> +                    if not fields:
>>> +                        continue
>>> +                    if fields[0] =3D=3D 'u':
>>> +                        useradd_params =3D ''
>>> +                        if fields[1] in s_users:
>>> +                            useradd_params +=3D '--uid %s' % =
s_users[fields[1]][2]
>>> +                            bb.warn("Changing user %s's uid to =
(%s), verify configuration files!" % (fields[1], s_users[fields[1]][2]))
>>> +                        elif fields[2] !=3D '-':
>>> +                            useradd_params +=3D '--uid %s' % =
fields[2]
>>> +                        if fields[3] !=3D '-':
>>> +                            useradd_params +=3D ' --comment "%s"' % =
fields[3]
>>> +                        useradd_params +=3D ' --root "%s" --shell =
/sbin/nologin  --system %s' % (d.getVar("IMAGE_ROOTFS", d), fields[1])
>>> +                        code =3D subprocess.call('useradd %s' % =
useradd_params, shell=3DTrue)
>>> +                    elif fields[0] =3D=3D 'g':
>>> +                        groupadd_params =3D ""
>>> +                        if fields[1] in s_groups:
>>> +                            groupadd_params +=3D '--gid %s' % =
s_groups[fields[1]][2]
>>> +                            bb.warn("Changing group %s's gid to =
(%s), verify configuration files!" % (fields[1], =
s_groups[fields[1]][2]))
>>> +                        elif fields[2] !=3D '-':
>>> +                            groupadd_params +=3D '--gid %s' % =
fields[2]
>>> +                        if fields[3] !=3D '-':
>>> +                            groupadd_params +=3D ' --comment "%s"' =
% (d.getVar("IMAGE_ROOTFS", d), fields[3])
>>> +                        groupadd_params +=3D ' --root "%s" --system =
%s' % (d.getVar("IMAGE_ROOTFS", d), fields[1])
>>> +                        code =3D subprocess.call('groupadd %s' % =
groupadd_params, shell=3DTrue)
>>> +}
>>>=20
>>> #
>>> # A hook function to support read-only-rootfs IMAGE_FEATURES
>>> @@ -73,27 +114,6 @@ read_only_rootfs_hook () {
>>> 			${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh
>>> 		fi
>>> 	fi
>>> -
>>> -	if ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "true", =
"false", d)}; then
>>> -	    # Update user database files so that services don't fail for =
a read-only systemd system
>>> -	    for conffile in =
${IMAGE_ROOTFS}/usr/lib/sysusers.d/systemd.conf =
${IMAGE_ROOTFS}/usr/lib/sysusers.d/systemd-remote.conf; do
>>> -		[ -e $conffile ] || continue
>>> -		grep -v "^#" $conffile | sed -e '/^$/d' | while read =
type name id comment; do
>>> -		    if [ "$type" =3D "u" ]; then
>>> -			useradd_params=3D""
>>> -			[ "$id" !=3D "-" ] && =
useradd_params=3D"$useradd_params --uid $id"
>>> -			[ "$comment" !=3D "-" ] && =
useradd_params=3D"$useradd_params --comment $comment"
>>> -			useradd_params=3D"$useradd_params --system =
$name"
>>> -			eval useradd --root ${IMAGE_ROOTFS} =
$useradd_params || true
>>> -		    elif [ "$type" =3D "g" ]; then
>>> -			groupadd_params=3D""
>>> -			[ "$id" !=3D "-" ] && =
groupadd_params=3D"$groupadd_params --gid $id"
>>> -			groupadd_params=3D"$groupadd_params --system =
$name"
>>> -			eval groupadd --root ${IMAGE_ROOTFS} =
$groupadd_params || true
>>> -		    fi
>>> -		done
>>> -	    done
>>> -	fi
>>> }
>>>=20
>>> #
>>> diff --git a/meta/classes/useradd-staticids.bbclass =
b/meta/classes/useradd-staticids.bbclass
>>> index a9b506d..e9dfe69 100644
>>> --- a/meta/classes/useradd-staticids.bbclass
>>> +++ b/meta/classes/useradd-staticids.bbclass
>>> @@ -1,3 +1,4 @@
>>> +inherit useradd-staticids-list
>>> # In order to support a deterministic set of 'dynamic' users/groups,
>>> # we need a function to reformat the params based on a static file
>>> def update_useradd_static_config(d):
>>> @@ -17,35 +18,6 @@ def update_useradd_static_config(d):
>>>        def error(self, message):
>>>            raise bb.build.FuncFailed(message)
>>>=20
>>> -    def list_extend(iterable, length, obj =3D None):
>>> -        """Ensure that iterable is the specified length by =
extending with obj
>>> -        and return it as a list"""
>>> -        return list(itertools.islice(itertools.chain(iterable, =
itertools.repeat(obj)), length))
>>> -
>>> -    def merge_files(file_list, exp_fields):
>>> -        """Read each passwd/group file in file_list, split each =
line and create
>>> -        a dictionary with the user/group names as keys and the =
split lines as
>>> -        values. If the user/group name already exists in the =
dictionary, then
>>> -        update any fields in the list with the values from the new =
list (if they
>>> -        are set)."""
>>> -        id_table =3D dict()
>>> -        for conf in file_list.split():
>>> -            if os.path.exists(conf):
>>> -                f =3D open(conf, "r")
>>> -                for line in f:
>>> -                    if line.startswith('#'):
>>> -                        continue
>>> -                    # Make sure there always are at least =
exp_fields elements in
>>> -                    # the field list. This allows for leaving out =
trailing
>>> -                    # colons in the files.
>>> -                    fields =3D =
list_extend(line.rstrip().split(":"), exp_fields)
>>> -                    if fields[0] not in id_table:
>>> -                        id_table[fields[0]] =3D fields
>>> -                    else:
>>> -                        id_table[fields[0]] =3D =
list(itertools.imap(lambda x, y: x or y, fields, id_table[fields[0]]))
>>> -
>>> -        return id_table
>>> -
>>>    # We parse and rewrite the useradd components
>>>    def rewrite_useradd(params):
>>>        # The following comes from --help on useradd from shadow
>>> @@ -73,19 +45,6 @@ def update_useradd_static_config(d):
>>>        parser.add_argument("-U", "--user-group", help=3D"create a =
group with the same name as the user", action=3D"store_const", =
const=3DTrue)
>>>        parser.add_argument("LOGIN", help=3D"Login name of the new =
user")
>>>=20
>>> -        # Return a list of configuration files based on either the =
default
>>> -        # files/passwd or the contents of USERADD_UID_TABLES
>>> -        # paths are resolved via BBPATH
>>> -        def get_passwd_list(d):
>>> -            str =3D ""
>>> -            bbpath =3D d.getVar('BBPATH', True)
>>> -            passwd_tables =3D d.getVar('USERADD_UID_TABLES', True)
>>> -            if not passwd_tables:
>>> -                passwd_tables =3D 'files/passwd'
>>> -            for conf_file in passwd_tables.split():
>>> -                str +=3D " %s" % bb.utils.which(bbpath, conf_file)
>>> -            return str
>>> -
>>>        newparams =3D []
>>>        users =3D None
>>>        for param in re.split('''[ \t]*;[ =
\t]*(?=3D(?:[^'"]|'[^']*'|"[^"]*")*$)''', params):
>>> @@ -206,19 +165,6 @@ def update_useradd_static_config(d):
>>>        parser.add_argument("-r", "--system", help=3D"create a system =
account", action=3D"store_true")
>>>        parser.add_argument("GROUP", help=3D"Group name of the new =
group")
>>>=20
>>> -        # Return a list of configuration files based on either the =
default
>>> -        # files/group or the contents of USERADD_GID_TABLES
>>> -        # paths are resolved via BBPATH
>>> -        def get_group_list(d):
>>> -            str =3D ""
>>> -            bbpath =3D d.getVar('BBPATH', True)
>>> -            group_tables =3D d.getVar('USERADD_GID_TABLES', True)
>>> -            if not group_tables:
>>> -                group_tables =3D 'files/group'
>>> -            for conf_file in group_tables.split():
>>> -                str +=3D " %s" % bb.utils.which(bbpath, conf_file)
>>> -            return str
>>> -
>>>        newparams =3D []
>>>        groups =3D None
>>>        for param in re.split('''[ \t]*;[ =
\t]*(?=3D(?:[^'"]|'[^']*'|"[^"]*")*$)''', params):
>>> diff --git a/useradd-staticids-list.bbclass =
b/useradd-staticids-list.bbclass
>>> new file mode 100644
>>> index 0000000..377f748
>>> --- /dev/null
>>> +++ b/useradd-staticids-list.bbclass
>>> @@ -0,0 +1,56 @@
>>> +# Return a list of configuration files based on either the default
>>> +# files/group or the contents of USERADD_GID_TABLES
>>> +# paths are resolved via BBPATH
>>> +def get_group_list(d):
>>> +    str =3D ""
>>> +    bbpath =3D d.getVar('BBPATH', True)
>>> +    group_tables =3D d.getVar('USERADD_GID_TABLES', True)
>>> +    if not group_tables:
>>> +        group_tables =3D 'files/group'
>>> +    for conf_file in group_tables.split():
>>> +        str +=3D " %s" % bb.utils.which(bbpath, conf_file)
>>> +    return str
>>> +
>>> +def list_extend(iterable, length, obj =3D None):
>>> +    import itertools
>>> +    """Ensure that iterable is the specified length by extending =
with obj
>>> +    and return it as a list"""
>>> +    return list(itertools.islice(itertools.chain(iterable, =
itertools.repeat(obj)), length))
>>> +
>>> +def merge_files(file_list, exp_fields):
>>> +    import itertools
>>> +    """Read each passwd/group file in file_list, split each line =
and create
>>> +    a dictionary with the user/group names as keys and the split =
lines as
>>> +    values. If the user/group name already exists in the =
dictionary, then
>>> +    update any fields in the list with the values from the new list =
(if they
>>> +    are set)."""
>>> +    id_table =3D dict()
>>> +    for conf in file_list.split():
>>> +        if os.path.exists(conf):
>>> +            f =3D open(conf, "r")
>>> +            for line in f:
>>> +                if line.startswith('#'):
>>> +                    continue
>>> +                # Make sure there always are at least exp_fields =
elements in
>>> +                # the field list. This allows for leaving out =
trailing
>>> +                # colons in the files.
>>> +                fields =3D list_extend(line.rstrip().split(":"), =
exp_fields)
>>> +                if fields[0] not in id_table:
>>> +                    id_table[fields[0]] =3D fields
>>> +                else:
>>> +                    id_table[fields[0]] =3D =
list(itertools.imap(lambda x, y: x or y, fields, id_table[fields[0]]))
>>> +
>>> +    return id_table
>>> +
>>> +# Return a list of configuration files based on either the default
>>> +# files/passwd or the contents of USERADD_UID_TABLES
>>> +# paths are resolved via BBPATH
>>> +def get_passwd_list(d):
>>> +    str =3D ""
>>> +    bbpath =3D d.getVar('BBPATH', True)
>>> +    passwd_tables =3D d.getVar('USERADD_UID_TABLES', True)
>>> +    if not passwd_tables:
>>> +        passwd_tables =3D 'files/passwd'
>>> +    for conf_file in passwd_tables.split():
>>> +        str +=3D " %s" % bb.utils.which(bbpath, conf_file)
>>> +    return str
>>> --
>>> 2.8.0
>>>=20
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>=20
>=20
>=20


--Apple-Mail=_73991FC9-BBFE-48D8-A029-DB1642C16058
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlcxMiIACgkQuwUzVZGdMxSIBACdHPW03bIh1de2FzEDpHKZBhz1
hYkAn0pOwky0fH6E6w7FpjeDbMJ/zcDA
=ubvk
-----END PGP SIGNATURE-----

--Apple-Mail=_73991FC9-BBFE-48D8-A029-DB1642C16058--
