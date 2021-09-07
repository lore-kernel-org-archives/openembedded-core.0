Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.4453.1631056985480232263
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Sep 2021 16:23:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kJLgB7Fz;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id mw10-20020a17090b4d0a00b0017b59213831so172940pjb.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Sep 2021 16:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=2QxwgkKMY10vtux7Hip8ue3p23GpNqNRdeLRdMM7ZjI=;
        b=kJLgB7Fz5vnLdEpN99ioUntehjHjMOkxeH7hV2GEYS2CuOc25HuXxjFzYhtWNU/LqS
         hVPjcqlgETU7ICkRt522M7kolAbIexuiBH9NklMErSNc8vchLO+Q40lUT3KFJj5YMnM1
         fo6BL3iHfUOoB6kHS8o15xYdI6Y4K3OsgCF5ifPhmq33FShKu9FyAz5kqQBwqeLyufxN
         WiWAZjImhbNu9gOB+BBGtsAq79gzttc5HAFw3uqyWNLnBAp/CFPDRI5y1k7dP0FcF7HY
         LhvlRBlqEXqjGFaAERucSGF+5OucIhr8S5nXuA452HDV/VDoL352Lsw6gxg5VzkLgPmr
         KqFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=2QxwgkKMY10vtux7Hip8ue3p23GpNqNRdeLRdMM7ZjI=;
        b=VYbvr3ezuD6UlBWZK/QnzC6VXpok0KP0nEJFT/epUYntFqxyBXV/EvDjv512VNBzOH
         MePWHVkuEWcddSOUwHNC/WCBtfJ8NB6TaBdsCNq3v0FQYF25Fk4HxWAkubvCDIfia4l4
         +uODO2kwLNK6+RIffrXB7Fsw+a4+ellm2tqTfXfP9XsKIScTU1a3CmsA3fSZJFrpCGS0
         JeMwa/aCzyMD0v2ZIxiW5jrkB0GXOXy679euf2U/bRny2/4eV7KK1KeGF9CglK2WBACu
         0ywNYlun07NVRwuxA8O444EE5wjsxXa2ILgy1jMZE5eTNci/BWrv8f5ZclI1Q5fzGhOJ
         OXOA==
X-Gm-Message-State: AOAM530kXbEKlzjz2At+S6pSDay5x+o+exr2ANXoXik0oaVNCoaKJ4Y2
	pBz5MUG7sF61N+MlaygBvXtVZZzcivk=
X-Google-Smtp-Source: ABdhPJxEx6eOZ1u9nreUiWvNHgYPdWRFQ2pl5NtAYzrihXdJsfeLnkKYdzXDy9PPUf4JRC/L5zISDA==
X-Received: by 2002:a17:902:9b90:b029:12d:5ce1:4d99 with SMTP id y16-20020a1709029b90b029012d5ce14d99mr630466plp.37.1631056984437;
        Tue, 07 Sep 2021 16:23:04 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:ece:8e2f:f07e:736f? ([2601:202:4180:a5c0:ece:8e2f:f07e:736f])
        by smtp.gmail.com with ESMTPSA id 15sm144607pfu.192.2021.09.07.16.23.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Sep 2021 16:23:03 -0700 (PDT)
Subject: Re: [OE-core] [Dunfell][PATCH] dbus: Security fix CVE-2020-35512
To: Steve Sakoman <steve@sakoman.com>, Steve Sakoman <sakoman@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <169F5B2C7D1DE1C6.32188@lists.openembedded.org>
 <833a309d-1c8c-6a2e-e3b7-7b2152d54338@gmail.com>
 <CAGDS+nm6Z1+TXBxNaEYNFjOH8PJfOrZrn9JV01mc7k8LHp8Cpw@mail.gmail.com>
 <CAOSpxdZFZW+aKCNuPPguS55tS1eCHjxrZk-hqkZHB0M-VASxBA@mail.gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <b88d0ac5-0c73-b6b2-c8b1-da4032870c00@gmail.com>
Date: Tue, 7 Sep 2021 16:23:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAOSpxdZFZW+aKCNuPPguS55tS1eCHjxrZk-hqkZHB0M-VASxBA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 9/2/21 7:55 PM, Steve Sakoman wrote:
> On Thu, Sep 2, 2021 at 8:38 AM Steve Sakoman <sakoman@gmail.com> wrote:
>> On Thu, Sep 2, 2021 at 8:10 AM Armin Kuster <akuster808@gmail.com> wrote:
>>> ping or did I miss a response to this patch?
>> No you didn't miss anything!
>>
>> I mistakenly stashed this patch along with your "lz4: Security Fix for
>> CVE-2021-3520" patch in a branch waiting for the lz4 equivalent to hit
>> master.
>>
>> Richard pushed the lz4 patch to master so now both patches are merged
>> and in test for dunfell.
> We're getting reproducible autobuilder ptest errors with this patch:
>
> AssertionError: Failed ptests:
> {'dbus-test': ['test/test-dbus-daemon',
>                'test/test-dbus-daemon-eavesdrop',
>                'test/test-monitor']}
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/2179
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/2460

It turns out that the patch would need to be applied to dbus-test as well.

After further investigation, the cleaner solution is to update to
version in Gategarth 1.12.20. That path includes consolidating the
common code between dbus and dbus-test which should help avoid any
future recipe mismatches.


Bug fix only changes.

ab88811768 (HEAD, tag: dbus-1.12.20) v1.12.20
5757fd5480 Update NEWS
f3b2574f0c userdb: Reference-count DBusUserInfo, DBusGroupInfo
37b36d49a6 userdb: Make lookups return a const pointer
732284d530 Solaris and derivatives do not adjust cmsg_len on MSG_CTRUNC
1f8c42c7cd Start 1.12.20 development
a0926ef86f (tag: dbus-1.12.18) Prepare 1.12.18
8bc1381819 fdpass test: Assert that we don't leak file descriptors
272d484283 sysdeps-unix: On MSG_CTRUNC, close the fds we did receive
31297172f1 Update NEWS
041d579139 dbus-daemon test: Don't test fd limits if in an unprivileged
container
55b3f71376 Update NEWS
ced04aabc7 doxygen: fix example for dbus_message_append_args
3e40637b10 Update NEWS
3e0ea34966 cmake: Add X11 include path for tools
d0992805d7 doc: replace dbus-send's --address with --peer and --bus
dd32f6b617 Update NEWS
d251fe7850 Merge branch 'cherry-pick-b034b83b' into 'dbus-1.12'
2c6b0ad7f6 bus: Don't explicitly clear BusConnections.monitors
df0c675b93 Merge branch 'cherry-pick-bf71a58e' into 'dbus-1.12'
beb79b94fb doc: Fix environment variable name in dbus-daemon(1)
eab5d4a420 Start 1.12.18 development


I will send a new patch set shortly.

-Armin
>
> Steve
>
>>> -armin
>>>
>>> On 8/27/21 8:37 PM, Armin Kuster via lists.openembedded.org wrote:
>>>> From: Armin Kuster <akuster@mvista.com>
>>>>
>>>> Source: https://gitlab.freedesktop.org/dbu
>>>> MR: 108825
>>>> Type: Security Fix
>>>> Disposition: Backport from https://gitlab.freedesktop.org/dbus/dbus/-/commit/e75c67a28fa2bc41a8ab0de433a52355c71a8abf
>>>> ChangeID: dea9518b9c13dab66e7d553c622000b9c6e268cc
>>>> Description:
>>>>
>>>> Affects: < 1.12.20
>>>>
>>>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>>>> ---
>>>>  .../dbus/dbus/CVE-2020-35512.patch            | 301 ++++++++++++++++++
>>>>  meta/recipes-core/dbus/dbus_1.12.16.bb        |   1 +
>>>>  2 files changed, 302 insertions(+)
>>>>  create mode 100644 meta/recipes-core/dbus/dbus/CVE-2020-35512.patch
>>>>
>>>> diff --git a/meta/recipes-core/dbus/dbus/CVE-2020-35512.patch b/meta/recipes-core/dbus/dbus/CVE-2020-35512.patch
>>>> new file mode 100644
>>>> index 0000000000..27f5d58675
>>>> --- /dev/null
>>>> +++ b/meta/recipes-core/dbus/dbus/CVE-2020-35512.patch
>>>> @@ -0,0 +1,301 @@
>>>> +From 2b7948ef907669e844b52c4fa2268d6e3162a70c Mon Sep 17 00:00:00 2001
>>>> +From: Simon McVittie <smcv@collabora.com>
>>>> +Date: Tue, 30 Jun 2020 19:29:06 +0100
>>>> +Subject: [PATCH] userdb: Reference-count DBusUserInfo, DBusGroupInfo
>>>> +
>>>> +Previously, the hash table indexed by uid (or gid) took ownership of the
>>>> +single reference to the heap-allocated struct, and the hash table
>>>> +indexed by username (or group name) had a borrowed pointer to the same
>>>> +struct that exists in the other hash table.
>>>> +
>>>> +However, this can break down if you have two or more distinct usernames
>>>> +that share a numeric identifier. This is generally a bad idea, because
>>>> +the user-space model in such situations does not match the kernel-space
>>>> +reality, and in particular there is no effective kernel-level security
>>>> +boundary between such users, but it is sometimes done anyway.
>>>> +
>>>> +In this case, when the second username is looked up in the userdb, it
>>>> +overwrites (replaces) the entry in the hash table that is indexed by
>>>> +uid, freeing the DBusUserInfo. This results in both the key and the
>>>> +value in the hash table that is indexed by username becoming dangling
>>>> +pointers (use-after-free), leading to undefined behaviour, which is
>>>> +certainly not what we want to see when doing access control.
>>>> +
>>>> +An equivalent situation can occur with groups, in the rare case where
>>>> +a numeric group ID has two names (although I have not heard of this
>>>> +being done in practice).
>>>> +
>>>> +Solve this by reference-counting the data structure. There are up to
>>>> +three references in practice: one held temporarily while the lookup
>>>> +function is populating and storing it, one held by the hash table that
>>>> +is indexed by uid, and one held by the hash table that is indexed by
>>>> +name.
>>>> +
>>>> +Closes: dbus#305
>>>> +Signed-off-by: Simon McVittie <smcv@collabora.com>
>>>> +
>>>> +Upsteam-Status: Backport
>>>> +https://gitlab.freedesktop.org/dbus/dbus/-/commit/e75c67a28fa2bc41a8ab0de433a52355c71a8abf
>>>> +CVE: CVE-2020-35512
>>>> +Signed-off-by: Armin Kuster <akuster@mvista.com>
>>>> +
>>>> +---
>>>> + dbus/dbus-sysdeps-unix.h |  2 ++
>>>> + dbus/dbus-userdb-util.c  | 38 ++++++++++++++++++-----
>>>> + dbus/dbus-userdb.c       | 67 ++++++++++++++++++++++++++++++----------
>>>> + dbus/dbus-userdb.h       |  6 ++--
>>>> + 4 files changed, 86 insertions(+), 27 deletions(-)
>>>> +
>>>> +Index: dbus-1.12.16/dbus/dbus-sysdeps-unix.h
>>>> +===================================================================
>>>> +--- dbus-1.12.16.orig/dbus/dbus-sysdeps-unix.h
>>>> ++++ dbus-1.12.16/dbus/dbus-sysdeps-unix.h
>>>> +@@ -105,6 +105,7 @@ typedef struct DBusGroupInfo DBusGroupIn
>>>> +  */
>>>> + struct DBusUserInfo
>>>> + {
>>>> ++  size_t      refcount;       /**< Reference count */
>>>> +   dbus_uid_t  uid;            /**< UID */
>>>> +   dbus_gid_t  primary_gid;    /**< GID */
>>>> +   dbus_gid_t *group_ids;      /**< Groups IDs, *including* above primary group */
>>>> +@@ -118,6 +119,7 @@ struct DBusUserInfo
>>>> +  */
>>>> + struct DBusGroupInfo
>>>> + {
>>>> ++  size_t      refcount;       /**< Reference count */
>>>> +   dbus_gid_t  gid;            /**< GID */
>>>> +   char       *groupname;      /**< Group name */
>>>> + };
>>>> +Index: dbus-1.12.16/dbus/dbus-userdb-util.c
>>>> +===================================================================
>>>> +--- dbus-1.12.16.orig/dbus/dbus-userdb-util.c
>>>> ++++ dbus-1.12.16/dbus/dbus-userdb-util.c
>>>> +@@ -38,6 +38,15 @@
>>>> +  * @{
>>>> +  */
>>>> +
>>>> ++static DBusGroupInfo *
>>>> ++_dbus_group_info_ref (DBusGroupInfo *info)
>>>> ++{
>>>> ++  _dbus_assert (info->refcount > 0);
>>>> ++  _dbus_assert (info->refcount < SIZE_MAX);
>>>> ++  info->refcount++;
>>>> ++  return info;
>>>> ++}
>>>> ++
>>>> + /**
>>>> +  * Checks to see if the UID sent in is the console user
>>>> +  *
>>>> +@@ -240,9 +249,9 @@ _dbus_get_user_id_and_primary_group (con
>>>> +  * @param gid the group ID or #DBUS_GID_UNSET
>>>> +  * @param groupname group name or #NULL
>>>> +  * @param error error to fill in
>>>> +- * @returns the entry in the database
>>>> ++ * @returns the entry in the database (borrowed, do not free)
>>>> +  */
>>>> +-DBusGroupInfo*
>>>> ++const DBusGroupInfo*
>>>> + _dbus_user_database_lookup_group (DBusUserDatabase *db,
>>>> +                                   dbus_gid_t        gid,
>>>> +                                   const DBusString *groupname,
>>>> +@@ -287,13 +296,14 @@ _dbus_user_database_lookup_group (DBusUs
>>>> +           dbus_set_error (error, DBUS_ERROR_NO_MEMORY, NULL);
>>>> +           return NULL;
>>>> +         }
>>>> ++      info->refcount = 1;
>>>> +
>>>> +       if (gid != DBUS_GID_UNSET)
>>>> +         {
>>>> +           if (!_dbus_group_info_fill_gid (info, gid, error))
>>>> +             {
>>>> +               _DBUS_ASSERT_ERROR_IS_SET (error);
>>>> +-              _dbus_group_info_free_allocated (info);
>>>> ++              _dbus_group_info_unref (info);
>>>> +               return NULL;
>>>> +             }
>>>> +         }
>>>> +@@ -302,7 +312,7 @@ _dbus_user_database_lookup_group (DBusUs
>>>> +           if (!_dbus_group_info_fill (info, groupname, error))
>>>> +             {
>>>> +               _DBUS_ASSERT_ERROR_IS_SET (error);
>>>> +-              _dbus_group_info_free_allocated (info);
>>>> ++              _dbus_group_info_unref (info);
>>>> +               return NULL;
>>>> +             }
>>>> +         }
>>>> +@@ -314,7 +324,7 @@ _dbus_user_database_lookup_group (DBusUs
>>>> +       if (!_dbus_hash_table_insert_uintptr (db->groups, info->gid, info))
>>>> +         {
>>>> +           dbus_set_error (error, DBUS_ERROR_NO_MEMORY, NULL);
>>>> +-          _dbus_group_info_free_allocated (info);
>>>> ++          _dbus_group_info_unref (info);
>>>> +           return NULL;
>>>> +         }
>>>> +
>>>> +Index: dbus-1.12.16/dbus/dbus-userdb.c
>>>> +===================================================================
>>>> +--- dbus-1.12.16.orig/dbus/dbus-userdb.c
>>>> ++++ dbus-1.12.16/dbus/dbus-userdb.c
>>>> +@@ -35,34 +35,57 @@
>>>> +  * @{
>>>> +  */
>>>> +
>>>> ++static DBusUserInfo *
>>>> ++_dbus_user_info_ref (DBusUserInfo *info)
>>>> ++{
>>>> ++  _dbus_assert (info->refcount > 0);
>>>> ++  _dbus_assert (info->refcount < SIZE_MAX);
>>>> ++  info->refcount++;
>>>> ++  return info;
>>>> ++}
>>>> ++
>>>> + /**
>>>> +- * Frees the given #DBusUserInfo's members with _dbus_user_info_free()
>>>> ++ * Decrements the reference count. If it reaches 0,
>>>> ++ * frees the given #DBusUserInfo's members with _dbus_user_info_free()
>>>> +  * and also calls dbus_free() on the block itself
>>>> +  *
>>>> +  * @param info the info
>>>> +  */
>>>> + void
>>>> +-_dbus_user_info_free_allocated (DBusUserInfo *info)
>>>> ++_dbus_user_info_unref (DBusUserInfo *info)
>>>> + {
>>>> +   if (info == NULL) /* hash table will pass NULL */
>>>> +     return;
>>>> +
>>>> ++  _dbus_assert (info->refcount > 0);
>>>> ++  _dbus_assert (info->refcount < SIZE_MAX);
>>>> ++
>>>> ++  if (--info->refcount > 0)
>>>> ++    return;
>>>> ++
>>>> +   _dbus_user_info_free (info);
>>>> +   dbus_free (info);
>>>> + }
>>>> +
>>>> + /**
>>>> +- * Frees the given #DBusGroupInfo's members with _dbus_group_info_free()
>>>> ++ * Decrements the reference count. If it reaches 0,
>>>> ++ * frees the given #DBusGroupInfo's members with _dbus_group_info_free()
>>>> +  * and also calls dbus_free() on the block itself
>>>> +  *
>>>> +  * @param info the info
>>>> +  */
>>>> + void
>>>> +-_dbus_group_info_free_allocated (DBusGroupInfo *info)
>>>> ++_dbus_group_info_unref (DBusGroupInfo *info)
>>>> + {
>>>> +   if (info == NULL) /* hash table will pass NULL */
>>>> +     return;
>>>> +
>>>> ++  _dbus_assert (info->refcount > 0);
>>>> ++  _dbus_assert (info->refcount < SIZE_MAX);
>>>> ++
>>>> ++  if (--info->refcount > 0)
>>>> ++    return;
>>>> ++
>>>> +   _dbus_group_info_free (info);
>>>> +   dbus_free (info);
>>>> + }
>>>> +@@ -124,7 +147,7 @@ _dbus_is_a_number (const DBusString *str
>>>> +  * @param error error to fill in
>>>> +  * @returns the entry in the database
>>>> +  */
>>>> +-DBusUserInfo*
>>>> ++const DBusUserInfo*
>>>> + _dbus_user_database_lookup (DBusUserDatabase *db,
>>>> +                             dbus_uid_t        uid,
>>>> +                             const DBusString *username,
>>>> +@@ -170,13 +193,14 @@ _dbus_user_database_lookup (DBusUserData
>>>> +           dbus_set_error (error, DBUS_ERROR_NO_MEMORY, NULL);
>>>> +           return NULL;
>>>> +         }
>>>> ++      info->refcount = 1;
>>>> +
>>>> +       if (uid != DBUS_UID_UNSET)
>>>> +         {
>>>> +           if (!_dbus_user_info_fill_uid (info, uid, error))
>>>> +             {
>>>> +               _DBUS_ASSERT_ERROR_IS_SET (error);
>>>> +-              _dbus_user_info_free_allocated (info);
>>>> ++              _dbus_user_info_unref (info);
>>>> +               return NULL;
>>>> +             }
>>>> +         }
>>>> +@@ -185,7 +209,7 @@ _dbus_user_database_lookup (DBusUserData
>>>> +           if (!_dbus_user_info_fill (info, username, error))
>>>> +             {
>>>> +               _DBUS_ASSERT_ERROR_IS_SET (error);
>>>> +-              _dbus_user_info_free_allocated (info);
>>>> ++              _dbus_user_info_unref (info);
>>>> +               return NULL;
>>>> +             }
>>>> +         }
>>>> +@@ -198,7 +222,7 @@ _dbus_user_database_lookup (DBusUserData
>>>> +       if (!_dbus_hash_table_insert_uintptr (db->users, info->uid, info))
>>>> +         {
>>>> +           dbus_set_error (error, DBUS_ERROR_NO_MEMORY, NULL);
>>>> +-          _dbus_user_info_free_allocated (info);
>>>> ++          _dbus_user_info_unref(info);
>>>> +           return NULL;
>>>> +         }
>>>> +
>>>> +@@ -568,24 +592,24 @@ _dbus_user_database_new (void)
>>>> +   db->refcount = 1;
>>>> +
>>>> +   db->users = _dbus_hash_table_new (DBUS_HASH_UINTPTR,
>>>> +-                                    NULL, (DBusFreeFunction) _dbus_user_info_free_allocated);
>>>> ++                                    NULL, (DBusFreeFunction) _dbus_user_info_unref);
>>>> +
>>>> +   if (db->users == NULL)
>>>> +     goto failed;
>>>> +
>>>> +   db->groups = _dbus_hash_table_new (DBUS_HASH_UINTPTR,
>>>> +-                                     NULL, (DBusFreeFunction) _dbus_group_info_free_allocated);
>>>> ++                                     NULL, (DBusFreeFunction) _dbus_group_info_unref);
>>>> +
>>>> +   if (db->groups == NULL)
>>>> +     goto failed;
>>>> +
>>>> +   db->users_by_name = _dbus_hash_table_new (DBUS_HASH_STRING,
>>>> +-                                            NULL, NULL);
>>>> ++                                            NULL, (DBusFreeFunction) _dbus_user_info_unref);
>>>> +   if (db->users_by_name == NULL)
>>>> +     goto failed;
>>>> +
>>>> +   db->groups_by_name = _dbus_hash_table_new (DBUS_HASH_STRING,
>>>> +-                                             NULL, NULL);
>>>> ++                                             NULL, (DBusFreeFunction) _dbus_group_info_unref);
>>>> +   if (db->groups_by_name == NULL)
>>>> +     goto failed;
>>>> +
>>>> +Index: dbus-1.12.16/dbus/dbus-userdb.h
>>>> +===================================================================
>>>> +--- dbus-1.12.16.orig/dbus/dbus-userdb.h
>>>> ++++ dbus-1.12.16/dbus/dbus-userdb.h
>>>> +@@ -76,19 +76,19 @@ dbus_bool_t       _dbus_user_database_ge
>>>> +                                                      DBusError            *error);
>>>> +
>>>> + DBUS_PRIVATE_EXPORT
>>>> +-DBusUserInfo*  _dbus_user_database_lookup       (DBusUserDatabase *db,
>>>> ++const DBusUserInfo*  _dbus_user_database_lookup       (DBusUserDatabase *db,
>>>> +                                                  dbus_uid_t        uid,
>>>> +                                                  const DBusString *username,
>>>> +                                                  DBusError        *error);
>>>> + DBUS_PRIVATE_EXPORT
>>>> +-DBusGroupInfo* _dbus_user_database_lookup_group (DBusUserDatabase *db,
>>>> ++const DBusGroupInfo* _dbus_user_database_lookup_group (DBusUserDatabase *db,
>>>> +                                                  dbus_gid_t        gid,
>>>> +                                                  const DBusString *groupname,
>>>> +                                                  DBusError        *error);
>>>> ++
>>>> ++void            _dbus_user_info_unref    (DBusUserInfo     *info);
>>>> + DBUS_PRIVATE_EXPORT
>>>> +-void           _dbus_user_info_free_allocated   (DBusUserInfo     *info);
>>>> +-DBUS_PRIVATE_EXPORT
>>>> +-void           _dbus_group_info_free_allocated  (DBusGroupInfo    *info);
>>>> ++void           _dbus_group_info_unref           (DBusGroupInfo    *info);
>>>> + #endif /* DBUS_USERDB_INCLUDES_PRIVATE */
>>>> +
>>>> + DBUS_PRIVATE_EXPORT
>>>> diff --git a/meta/recipes-core/dbus/dbus_1.12.16.bb b/meta/recipes-core/dbus/dbus_1.12.16.bb
>>>> index 10d1b34448..13d453eb32 100644
>>>> --- a/meta/recipes-core/dbus/dbus_1.12.16.bb
>>>> +++ b/meta/recipes-core/dbus/dbus_1.12.16.bb
>>>> @@ -17,6 +17,7 @@ SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
>>>>             file://dbus-1.init \
>>>>             file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
>>>>             file://CVE-2020-12049.patch \
>>>> +           file://CVE-2020-35512.patch \
>>>>  "
>>>>
>>>>  SRC_URI[md5sum] = "2dbeae80dfc9e3632320c6a53d5e8890"
>>>>
>>>>
>>>>
>>>
>>>
>>>
>> 
>>

